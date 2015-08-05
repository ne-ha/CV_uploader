# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'page:change', ->
  $('#upload_resume').click ->
    $('#uploadModal').modal 'show'
    return
  return

validateFiles = (inputFile) ->
  maxExceededMessage = 'This file exceeds the maximum allowed file size (2 MB)'
  extErrorMessage = 'Only file with extension: .pdf, .doc, or .docx is allowed'
  allowedExtension = [
    'pdf'
    'doc'
    'docx'
  ]
  extName = undefined
  maxFileSize = $(inputFile).data('max-file-size')
  sizeExceeded = false
  extError = false
  $.each inputFile.files, ->
    if @size and maxFileSize and @size > parseInt(maxFileSize)
      sizeExceeded = true
    extName = @name.split('.').pop()
    if $.inArray(extName, allowedExtension) == -1
      extError = true
    return
  if sizeExceeded
    window.alert maxExceededMessage
    $(inputFile).val ''
  if extError
    window.alert extErrorMessage
    $(inputFile).val ''
  return