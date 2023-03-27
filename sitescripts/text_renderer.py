"""
HTML renderer
"""
import html
from typing import TYPE_CHECKING, Any, cast
from urllib.parse import quote

from marko import Renderer

if TYPE_CHECKING:
    from . import inline, block


class TextRenderer(Renderer):

    def render_paragraph(self, element: "block.Paragraph") -> str:
        return f"{self.render_children(element)}\n"

    def render_list(self, element: "block.List") -> str:
        return "{children}".format(children=self.render_children(element))

    def render_list_item(self, element: "block.ListItem") -> str:
        return f"{self.render_children(element)}\n"

    def render_quote(self, element: "block.Quote") -> str:
        return f"{self.render_children(element)}\n"

    def render_fenced_code(self, element: "block.FencedCode") -> str:
        return "{}\n".format(
            html.escape(element.children[0].children)  # type: ignore
        )

    def render_code_block(self, element: "block.CodeBlock") -> str:
        return self.render_fenced_code(cast("block.FencedCode", element))

    def render_html_block(self, element: "block.HTMLBlock") -> str:
        return element.children  # type: ignore

    def render_thematic_break(self, element: "block.ThematicBreak") -> str:
        return "\n"

    def render_heading(self, element: "block.Heading") -> str:
        return "{children}\n".format(
            children=self.render_children(element)
        )

    def render_setext_heading(self, element: "block.SetextHeading") -> str:
        return self.render_heading(cast("block.Heading", element))

    def render_blank_line(self, element: "block.BlankLine") -> str:
        return ""

    def render_link_ref_def(self, element: "block.LinkRefDef") -> str:
        return ""

    def render_emphasis(self, element: "inline.Emphasis") -> str:
        return self.render_children(element)

    def render_strong_emphasis(self, element: "inline.StrongEmphasis") -> str:
        return self.render_children(element)

    def render_inline_html(self, element: "inline.InlineHTML") -> str:
        return self.render_html_block(cast("block.HTMLBlock", element))

    def render_plain_text(self, element: Any) -> str:
        return self.render_children(element)

    def render_link(self, element: "inline.Link") -> str:
        return self.render_children(element)

    def render_auto_link(self, element: "inline.AutoLink") -> str:
        return self.render_link(cast("inline.Link", element))

    def render_image(self, element: "inline.Image") -> str:
        return self.render_children(element)

    def render_literal(self, element: "inline.Literal") -> str:
        return self.render_raw_text(cast("inline.RawText", element))

    def render_raw_text(self, element: "inline.RawText") -> str:
        return element.children

    def render_line_break(self, element: "inline.LineBreak") -> str:
        return "\n"

    def render_code_span(self, element: "inline.CodeSpan") -> str:
        return cast(str, element.children)

