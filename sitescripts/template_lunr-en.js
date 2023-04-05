---
layout: none
---
// This replaces the default lunr indexing logic by using the same filename as the template uses
// It needs to be replaced because we can pregenerate the index and vastly improve the speed. But,
// in pregenerating we need to change the logic for how the file gets loaded.

// loadJSON method to open the JSON file.
function loadJSON(path, success, error) {
  var xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function () {
    if (xhr.readyState === 4) {
      if (xhr.status === 200) {
        success(JSON.parse(xhr.responseText));
      }
      else {
        error(xhr);
      }
    }
  };
  xhr.open('GET', path, true);
  xhr.send();
}
const indexPath = "##{SiteAbsoluteRootUrl}##/index.json";
loadJSON(indexPath, myData, myError);

var idx;
function myData(Data)
{
    idx = lunr.Index.load(Data)
}

function myError(Error)
{
    console.log(`Error retrieving ${indexPath}: ${Error}`)
}

const refToTeaserPath = "##{SiteAbsoluteRootUrl}##/refToTeaser.json";
loadJSON(refToTeaserPath, refToTeaserData, myError);
var refToTeaser;
function refToTeaserData(Data)
{
    refToTeaser = Data
}

$(document).ready(function() {
  $('input#search').on('keyup', function () {
    var resultdiv = $('#results');
    var query = $(this).val().toLowerCase();
    var result =
      idx.query(function (q) {
        query.split(lunr.tokenizer.separator).forEach(function (term) {
          q.term(term, { boost: 100 })
          if(query.lastIndexOf(" ") != query.length-1){
            q.term(term, {  usePipeline: false, wildcard: lunr.Query.wildcard.TRAILING, boost: 10 })
          }
          if (term != ""){
            q.term(term, {  usePipeline: false, editDistance: 1, boost: 1 })
          }
        })
      });
    resultdiv.empty();
    resultdiv.prepend('<p class="results__found">'+result.length+' {{ site.data.ui-text[site.locale].results_found | default: "Result(s) found" }}</p>');
    for (var item in result) {
        var ref = result[item].ref;
        var searchitem =
          '<div class="list__item">'+
            '<article class="archive__item" itemscope itemtype="https://schema.org/CreativeWork">'+
              '<h2 class="archive__item-title" itemprop="headline">'+
                '<a href="'+ref+'" rel="permalink">'+refToTeaser[ref].title+' (' + refToTeaser[ref].site + '/' + refToTeaser[ref].section + ')'+'</a>'+
              '</h2>'+
              '<p class="archive__item-excerpt" itemprop="description">'+refToTeaser[ref].teaser+'</p>'+
            '</article>'+
          '</div>';

      resultdiv.append(searchitem);
    }
  });
});
