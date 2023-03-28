{% raw %}Ned: good to have a chance to talk about topics around API and
downstream applications incl. viz

Topics:

- \- current enpoint is only parsing; perhaps other endpoints? e.g.
generation

Stephan: anything the current interactive ERG demo can do should be
pretty easy.

Worrying about storage on the server... MRS is slightly larger, might
need worry abt that.

Caching

GET vs. POST? size limit. [StackOverflow](/StackOverflow): 8k octets? in
practice. Unicode is bigger when %-encoded. It's at least something to
think about. No problem supporting both.

Woodley: GET is idempotent; POST is not.

Mike: If we consider more than just parse/generate, more POST/PUT-like.
Current parse is a GET with URL-encoded variables.

Maybe before too long we should have JSON-encoded body for the API

Mike: not confusing for users to POST

Stephan: Client would probably always use POST; mostly talking
programmatically

Operations: \* parse \* generate \* browse/\_/\_ (ie profiles) \* semi

Ned: capabilities of server? want to know capabilities.

GET features vs. OPTIONS.

Stephan: how do we develop/document/maintain API?

JSON Schema? Differentiate between JSON-encoded API data describing API
vs. JSON-Schema describing the valid messages.

We don't need to do all of this to get going, but we probably want to do
it right.

Ranking priorities: 1 We have GET/parse 2 Next would be
POST,GET/generate

Note: what is hard so far is serialization to JSON

Need a JSON serialization for MRS/DMRS. Mike: proposal out there; Ann
wanted composite.

If missing capability, should return HTTP 501.

For capabilities can use Lisp \*features\* model? "dmrs,mrs,eds"? What
about differences between verbs?

Server might offer capabilities that aren't included in the options the
query URL can support Maybe don't want to cover all of the options that
don't affect client operation in "notes"

Ned: minor feature request - metadata (which grammar version, which
parser, etc)

Mike:

- bottlenose/grm/$verb
  
  &lt;server-key&gt;/&lt;grammar-key&gt;/&lt;what-to-do&gt;

Something like [UserAgent](/UserAgent) string, but not terrible.

Stephan: like the idea that the grammar version is in part included in
the URL. Don't want to commit to maintaining old versions forever, but
could easily see e.g. 1214 and trunk.

Mike: Does ACE read the version.lsp?

Woodley: Yes. It's available, but could be easier to get to.

Stephan: other information stored: Maxent model, number of active roots,
etc

Woodley: keep it simple.

Ned: What about getting shortlabels from ACE? Currently need to do an
additional parse to get them.

Mike: currently can query via LUI to get more post-parse information
that's not in the standard out protocol

Woodley: probably easier to include shortlabels directly in standard out
protocol. There's been hope from various parties for a while that ACE's
standard output would be more structured. Currently in addition to
realizations there are some lines that come out with key=value format.
Can get probabilities etc. out of that.

Ned: what's currently on the wiki is the '[ErgApi](https://delph-in.github.io/docs/erg/ErgApi)'. Needs to be
generalized.

Woodley: in terms of performance/resources, what about e.g. someone in
industry that might want to use this to throw all their sentences
through?

Mike: I currently run ACE once per request.

Stephan: I use \[incr tsdb()\] that's always up and running; apache
proxy to allegroserve Small number of constant users don't scare me,
plus I throttle. They could take the throttling out and get slightly
better performance, but it could work.

Mike: right now server API interprets requests, returns JSON response
object should be the same if we just used the ACE interface in
pyDelphin.

On to visualization demo.

Ned: one improvement to the vizualization that Francis suggested was
intercommunication between the different visualizers. Are there any
other visualizations that would be nice to have? One we're missing would
be the EDS output.

Stephan: For years I've been meaning to re-do the MRS rendering in the
demo; too TFS-like and too large. Make it look more like a logical form
with predicates and arguments.

How is that different from Simple MRS? That's the standardized form that
we use to write to files. Serialization more than visualization. LKB?
That's a different Simple MRS. But there is a very close correspondence.

Glenn: Index MRS?

Stephan: not information-preserving (doesn't include argument labels).
Ann wants to preserve this distinction for "Indexed": that argument
labels are not preserved but appear in order.

Glenn: does it make sense to have that type of format here?

Stephan: No. I'd rather do the variant that is used in the tutorial,
that is indexed+arglabels.

Do people like the Simple MRS display format? Generally no. Very pretty
for what it is (thanks Ned) but it gets hard to read beyond a few
brackeds.

TJ: SVG can't autowrap, but HTML version can.

Ned: another thing I just hooked up is that you can paste the URL and
get the visualizations again.

All: oooh!

Mike: this (what??) is currently still maintained in the demophin
codebase; can pull it over into a library fairly easily

Ned/Mike: it's a goal/requirement.

Underneath all of these is JSON serializations.

Stephan: showing wesearch.delph-in.net visualizations

Can do BRAT. SDP format (ConLL like). Nice feature is that BRAT
annotations are standoff. Would be good for the visualisations to be
interoperable.

Last update: 2016-06-20 by NedLetcher [[edit](https://github.com/delph-in/docs/wiki/StanfordAPI/_edit)]{% endraw %}