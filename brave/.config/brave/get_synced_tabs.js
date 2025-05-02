(function () {
  /* search for this element: <div id="tab-item-list"> */
  const container = document
    .querySelector("#history-app")
    .shadowRoot.querySelector("#main-container > #content > #synced-devices")
    .shadowRoot.querySelector(
      "#synced-device-list > history-synced-device-card"
    )
    .shadowRoot.querySelector(
      "#history-item-container > #collapse > #tab-item-list"
    );
  const linksNodeList = container.querySelectorAll("a");
  console.info(`Found ${linksNodeList.length} links.`);

  const links = Array.from(linksNodeList).map((link) => ({
    href: link.href,
    text: link.textContent,
    markdown: `[${link.textContent}](${link.href})`,
  }));

  const masterContainer = document.createElement("div");
  masterContainer.style.height = "40vh";
  masterContainer.style.overflowY = "scroll";
  document.body.insertAdjacentElement("afterbegin", masterContainer);
  document.body.style.overflowY = "scroll";

  links.forEach((link) => {
    const textarea = document.createElement("textarea");
    textarea.value = link.markdown;
    textarea.style.width = "100%";
    textarea.style.height = "fit-content";
    textarea.addEventListener("focus", (e) => {
      textarea.select();
      navigator.clipboard.writeText(textarea.value);
      console.info("Copied to clipboard", textarea.value);
    });
    masterContainer.appendChild(textarea);
  });
})();
