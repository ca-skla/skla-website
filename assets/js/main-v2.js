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

  // Footer year
  var yr = document.querySelector("#year");
  if (yr) yr.textContent = new Date().getFullYear();
})();
