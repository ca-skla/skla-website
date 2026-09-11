/* SKLA — Redesign V2 site interactions */
(function () {
  "use strict";

  // Header scroll state
  var header = document.querySelector(".site-header");
  function onScroll() {
    if (!header) return;
    header.classList.toggle("scrolled", window.scrollY > 30);
  }
  window.addEventListener("scroll", onScroll, { passive: true });
  onScroll();

  // Mobile nav
  var toggle = document.querySelector(".nav-toggle");
  var links = document.querySelector(".nav-links");
  if (toggle && links) {
    toggle.addEventListener("click", function () {
      toggle.classList.toggle("open");
      links.classList.toggle("open");
      document.body.classList.toggle("nav-open");
    });
    links.querySelectorAll("a").forEach(function (a) {
      a.addEventListener("click", function () {
        toggle.classList.remove("open");
        links.classList.remove("open");
        document.body.classList.remove("nav-open");
      });
    });
  }

  // Reveal on scroll
  var reveals = document.querySelectorAll(".reveal");
  if ("IntersectionObserver" in window) {
    var io = new IntersectionObserver(function (entries) {
      entries.forEach(function (e) {
        if (e.isIntersecting) { e.target.classList.add("in"); io.unobserve(e.target); }
      });
    }, { threshold: 0.12 });
    reveals.forEach(function (el) { io.observe(el); });
  } else {
    reveals.forEach(function (el) { el.classList.add("in"); });
  }

  // Accordion (services)
  document.querySelectorAll(".acc-head").forEach(function (btn) {
    btn.addEventListener("click", function () {
      var item = btn.closest(".acc-item");
      var body = item.querySelector(".acc-body");
      if (item.classList.contains("open")) {
        item.classList.remove("open");
        body.style.maxHeight = null;
      } else {
        item.classList.add("open");
        body.style.maxHeight = body.scrollHeight + "px";
      }
    });
  });

  // FAQ accordion (insights article pages)
  document.querySelectorAll(".faq-q").forEach(function (btn) {
    btn.addEventListener("click", function () {
      var item = btn.closest(".faq-item");
      var ans = item.querySelector(".faq-a");
      if (item.classList.contains("open")) {
        item.classList.remove("open");
        ans.style.maxHeight = null;
      } else {
        item.classList.add("open");
        ans.style.maxHeight = ans.scrollHeight + "px";
      }
    });
  });

  // Insights audience filter (insights index page)
  var filterPills = document.querySelectorAll(".filter-pill");
  if (filterPills.length) {
    filterPills.forEach(function (pill) {
      pill.addEventListener("click", function () {
        var f = pill.getAttribute("data-filter");
        filterPills.forEach(function (p) { p.classList.remove("active"); });
        pill.classList.add("active");
        document.querySelectorAll(".post-card, .update-item").forEach(function (card) {
          var aud = card.getAttribute("data-audience") || "";
          var show = f === "all" || aud.split(" ").indexOf(f) !== -1;
          card.classList.toggle("hidden", !show);
        });
      });
    });
  }

  // Animated counters (if any [data-count] present)
  var counters = document.querySelectorAll("[data-count]");
  if (counters.length && "IntersectionObserver" in window) {
    var cio = new IntersectionObserver(function (entries) {
      entries.forEach(function (e) {
        if (!e.isIntersecting) return;
        var el = e.target;
        var target = parseFloat(el.getAttribute("data-count"));
        var suffix = el.getAttribute("data-suffix") || "";
        var dur = 1400, start = null;
        function tick(ts) {
          if (!start) start = ts;
          var p = Math.min((ts - start) / dur, 1);
          var val = Math.floor((0.5 - Math.cos(p * Math.PI) / 2) * target);
          el.textContent = val + suffix;
          if (p < 1) requestAnimationFrame(tick);
          else el.textContent = target + suffix;
        }
        requestAnimationFrame(tick);
        cio.unobserve(el);
      });
    }, { threshold: 0.5 });
    counters.forEach(function (c) { cio.observe(c); });
  }

  // Contact form — validate, honeypot screen, deliver via backend
  var form = document.querySelector("#contactForm");
  if (form) {
    var card = form.closest(".form-card") || document;
    var okMsg = card.querySelector(".form-success");
    var errMsg = card.querySelector(".form-error");
    var submitBtn = form.querySelector("button[type=submit]");
    var submitLabel = submitBtn ? submitBtn.innerHTML : "";

    function setInvalid(field, bad) {
      var wrap = field.closest(".field");
      if (wrap) wrap.classList.toggle("invalid", bad);
    }
    function isEmail(v) { return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(v); }
    function showError(html) {
      if (!errMsg) return;
      errMsg.innerHTML = html;
      errMsg.classList.add("show");
      errMsg.scrollIntoView({ behavior: "smooth", block: "center" });
    }

    form.querySelectorAll("input, select, textarea").forEach(function (f) {
      f.addEventListener("input", function () { setInvalid(f, false); });
    });

    form.addEventListener("submit", function (e) {
      e.preventDefault();
      if (okMsg) okMsg.classList.remove("show");
      if (errMsg) errMsg.classList.remove("show");

      var honey = form.querySelector("[name=_honey]");
      if (honey && honey.value) { if (okMsg) okMsg.classList.add("show"); form.reset(); return; }

      var name = form.querySelector("#name");
      var email = form.querySelector("#email");
      var message = form.querySelector("#message");
      var firstBad = null;
      [name, email, message].forEach(function (f) {
        var val = f.value.trim();
        var bad = !val || (f === email && !isEmail(val));
        setInvalid(f, bad);
        if (bad && !firstBad) firstBad = f;
      });
      if (firstBad) { showError("Please fill in your name, a valid email, and a message."); firstBad.focus(); return; }

      var endpoint = form.getAttribute("action");
      if (submitBtn) { submitBtn.disabled = true; submitBtn.textContent = "Sending…"; }

      var payload = {};
      new FormData(form).forEach(function (v, k) { payload[k] = v; });

      fetch(endpoint, {
        method: "POST",
        headers: { "Accept": "application/json", "Content-Type": "application/json" },
        body: JSON.stringify(payload)
      })
        .then(function (r) { return r.json().catch(function () { return {}; }).then(function (d) { return { ok: r.ok, data: d }; }); })
        .then(function (res) {
          if (!res.ok) throw new Error((res.data && res.data.message) || "Request failed");
          if (okMsg) { okMsg.classList.add("show"); okMsg.scrollIntoView({ behavior: "smooth", block: "center" }); }
          form.reset();
        })
        .catch(function () {
          showError('Sorry, something went wrong sending your message. Please email us directly at <a href="mailto:skla@skla.in">skla@skla.in</a>.');
        })
        .finally(function () { if (submitBtn) { submitBtn.disabled = false; submitBtn.innerHTML = submitLabel; } });
    });
  }

  // WhatsApp floating contact button (styles: style-v2.css "WHATSAPP FLOATING CONTACT BUTTON").
  // A contact affordance, not a chat widget: it never opens a bubble or starts a conversation. It is
  // the footer's WhatsApp link kept within reach, so it yields while that link is on screen and is
  // skipped on the contact page, whose own content already offers the link.
  var WA_HREF = "https://wa.me/919885580871";
  var pageOffersWhatsApp = document.querySelector(".contact-item a[href*='wa.me']");
  if (!pageOffersWhatsApp && !document.querySelector(".wa-fab")) {
    var fab = document.createElement("a");
    fab.className = "wa-fab";
    fab.href = WA_HREF;
    fab.target = "_blank";
    fab.rel = "noopener";
    fab.setAttribute("aria-label", "Chat with S K Lahoti Associates on WhatsApp (opens in a new tab)");
    fab.innerHTML =
      '<span class="wa-fab__label" aria-hidden="true">Chat on WhatsApp</span>' +
      '<span class="wa-fab__icon" aria-hidden="true"><svg viewBox="0 0 24 24" fill="currentColor" focusable="false">' +
      '<path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893a11.821 11.821 0 00-3.48-8.413Z"/>' +
      '</svg></span>';
    document.body.appendChild(fab);

    var reduceMotion = window.matchMedia && window.matchMedia("(prefers-reduced-motion: reduce)").matches;
    window.setTimeout(function () { fab.classList.add("is-in"); }, reduceMotion ? 0 : 900);

    var footerLink = document.querySelector(".site-footer a[href*='wa.me']");
    if (footerLink && "IntersectionObserver" in window) {
      new IntersectionObserver(function (entries) {
        fab.classList.toggle("is-yield", entries[0].isIntersecting);
      }, { threshold: 0 }).observe(footerLink);
    }
  }

  // Footer year
  var yr = document.querySelector("#year");
  if (yr) yr.textContent = new Date().getFullYear();
})();
