alias Rumbl.Multimedia

for category <- ~w(Action Drama Comedy Sci-fi) do
  Multimedia.create_category!(category)
end
