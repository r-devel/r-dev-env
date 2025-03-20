const codeBlocks = [...document.querySelectorAll(".highlight > pre > code")];

const rules = [
    // shell commands
    {
        prefix: "$ ",
        classes: ["code-noselect", "console-input"],
    },
    // comments
    {
        prefix: "# ",
        plainText: true,
        entireLine: true,
        classes: ["code-noselect", "c1"],
    },
    // standard output
    {
        prefix: "<< ",
        plainText: true,
        entireLine: true,
        deletePrefix: true,
        classes: ["code-noselect", "console-output"],
    },
];

const zip = (a, b) => a.map((k, i) => [k, b[i]]);

// update code blocks with the mappings defined above
codeBlocks.forEach((block) => {
    let text = (block.textContent || "").split("\n");
    let html = block.innerHTML.split("\n");
    let lines = zip(text, html);

    lines = lines.map((line) => {
        const lineText = line[0];
        const lineHtml = line[1];

        const matches = rules.filter((rule) => lineText.startsWith(rule.prefix));

        if (matches.length > 1) {
            throw new Error("multiple rule matches");
        }

        if (matches.length === 1) {
            const matchingRule = matches[0];
            const classes = matchingRule.classes.join(" ");
            let newContent;

            if (matchingRule.plainText) {
                newContent = lineText;
            } else {
                newContent = lineHtml;
                newContent = newContent.replace(
                    matchingRule.prefix.replace(" ", `<span class="w"> </span>`),
                    matchingRule.prefix
                );
            }

            if (matchingRule.entireLine) {
                newContent = `<span class="${classes}">${newContent}</span>`;
            } else {
                newContent = newContent.replace(
                    matchingRule.prefix,
                    `<span class="${classes}">${matchingRule.prefix}</span>`
                );
            }

            if (matchingRule.deletePrefix) {
                newContent = newContent.replace(matchingRule.prefix, "");
            }

            return newContent;
        } else {
            return lineHtml;
        }
    });

    block.innerHTML = lines.join("\n").trim();
});

// Update html attributes to remove elements with `code-noselect` when copying to clipboard
window.addEventListener("load", () => {
    const ids = document.querySelectorAll("*[data-clipboard-target]");
    ids.forEach((id) => {
        const attr = id.getAttribute("data-clipboard-target");
        if (!attr) {
            return;
        }
        const node = document.querySelector(attr);
        if (!node) {
            return;
        }
        let text = [];
        node.childNodes.forEach((child) => {
            if (child.nodeName === "#text") {
                text.push(child.textContent || "");
            } else if (!child.classList.contains("code-noselect")) {
                text.push(child.innerText);
            }
        });
        let joinedText = text.join("");
        id.setAttribute(
            "data-clipboard-text",
            joinedText.trim().replace(/(?:\h*\n){2,}/g, "\n")
        );
        id.removeAttribute("data-clipboard-target");
    });
});
