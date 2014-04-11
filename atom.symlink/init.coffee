path = require 'path'

atom.workspaceView.eachEditorView (editorView) ->
  editor = editorView.getEditor()
  if path.extname(editor.getPath()) is '.md'
    editor.setSoftWrap(true)

# Set the default window size on each atom start.
atom.setWindowDimensions({"width": 2250, "height": 1350})
