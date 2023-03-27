// This custom Github Action is designed to pre-build the search index used by the site.
// It is then loaded by lunr-en.js on the site.
const core = require('@actions/core');
const github = require('@actions/github');
const fs = require("fs");
const lunr = require('lunr')

const pathToFile = core.getInput('json-data-file-path');
const indexFile = core.getInput('index-file-path');
const refToTeaserMapFile = core.getInput('ref-to-teaser-path');

fs.readFile(pathToFile, "utf8", (err, jsonString) => {
    if (err) {
        console.log("Error reading file from disk:", err);
        return;
    }

    const documents = JSON.parse(jsonString);
    var refToTeaserMap = {};

    var idx = lunr(function () {
        this.field('title')
        this.field('excerpt')
        this.field('categories')
        this.field('tags')
        this.ref('url')

        documents.forEach(function (doc) {
            console.log(`Link processed: ${doc.link}`)
            this.add(doc)
            refToTeaserMap[doc["url"]] = {"title": doc["title"], "site": doc["site"], "section": doc["section"], "teaser": doc["teaser"]}
        }, this);
    });

    console.log(`Serializing index...`)
    const content = JSON.stringify(idx);
    fs.writeFile(indexFile, content, err => {
        if (err) {
            console.error(err);
        }
        else {
            console.log(`Done.`)
        }
    });

    console.log(`Serializing refToTeaserMap...`)
    const refToTeaserMapContent = JSON.stringify(refToTeaserMap);
    fs.writeFile(refToTeaserMapFile, refToTeaserMapContent, err => {
        if (err) {
            console.error(err);
        }
        else {
            console.log(`Done.`)
        }
    });
});
