def app
  instance = Dynamo::App.instance
  instance.prepare(BUILD_STRUCTURE_XML)
  instance
end
