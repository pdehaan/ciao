
class ScriptParser

  constructor: (@script='') ->

    section = title: '', source: ''

    @sections =
      junk: [ section ]
      auth: []
      request: []
      assert: []

    for line in @lines = @script.toString('utf8').split('\n')

      if title = line.match /^## (.*)$/
        @sections.junk.push section = title: title[1], source: ''

      else if title = line.match /^#\! (.*)$/
        @sections.auth.push section = title: title[1], source: ''

      else if title = line.match /^#> (.*)$/
        @sections.request.push section = title: title[1], source: ''

      else if title = line.match /^#\? (.*)$/
        @sections.assert.push section = title: title[1], source: ''

      else if line.replace /\s/, ''
        section.source += ( if section.source then '\n' + line else line )

module.exports = ScriptParser