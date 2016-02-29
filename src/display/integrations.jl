@require Gadfly begin
  @render Inline p::Gadfly.Plot begin
    Tree(Text{UTF8String}("Plot"),
         [div(d(:style=>"background: white; width: 150%"),
              HTML(stringmime("text/html", p)))])
  end
end
