jQuery ->
  new CodeInsertion()
  

class CodeInsertion
  constructor: ->
    _self = this
    $('.code-insert').click (e) ->
      e.preventDefault()
      form = $(this).closest('.repo-user-description').find('form')
      textArea = form.find('textarea')
      language = form.find('input#language').attr 'value'
      _self.insertAtCaret(textArea.get(0), "\n\n```#{language}\nInsert your code here\n```")
      textArea.highlightTextarea
        words: [ 'Insert your code here' ]
      textArea.highlightTextarea 'disable'
      textArea.highlightTextarea 'enable'
      

  insertAtCaret: (textArea, text) ->
    scrollPos = textArea.scrollTop
    strPos = 0
    browser = ((if (textArea.selectionStart or textArea.selectionStart is "0") then "ff"
    else ((if document.selection then "ie" else false))))

    if browser is "ie"
      textArea.focus()
      range = document.selection.createRange()
      range.moveStart "character", -textArea.value.length
      strPos = range.text.length
    else strPos = textArea.selectionStart  if browser is "ff"

    front = (textArea.value).substring(0, strPos)
    back = (textArea.value).substring(strPos, textArea.value.length)
    textArea.value = front + text + back
    strPos = strPos + text.length

    if browser is "ie"
      textArea.focus()
      range = document.selection.createRange()
      range.moveStart "character", -textArea.value.length
      range.moveStart "character", strPos
      range.moveEnd "character", 0
      range.select()
    else if browser is "ff"
      textArea.selectionStart = strPos
      textArea.selectionEnd = strPos
      textArea.focus()

    textArea.scrollTop = scrollPos

@CodeInsertion = CodeInsertion
    
