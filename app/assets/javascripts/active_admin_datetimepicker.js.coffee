#= require jquery.xdan.datetimepicker.full

@setupDateTimePicker = (container) ->
  defaults = {
    formatDate: 'd-m-y',
    format: 'd-m-Y H:i',
    allowBlank: true,
    defaultSelect: false,
    validateOnBlur: false
  }

  entries = $(container).find('input.date-time-picker')
  entries.each (index, entry) ->
    options = $(entry).data 'datepicker-options'
    $(entry).datetimepicker $.extend(defaults, options)

@initXdanDateTimePickerPlugin = () ->
  setupDateTimePicker $('body')
  $(document).on 'has_many_add:after', '.has_many_container', (e, fieldset) ->
    setupDateTimePicker fieldset

$(document).ready ->
  initXdanDateTimePickerPlugin()

$(document).on 'turbolinks:load', ->
  initXdanDateTimePickerPlugin()
