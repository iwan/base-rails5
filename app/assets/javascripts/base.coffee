BaseRails5 = 
  requred_field_sign: "*"



ready = ->
  $(".dropdown-toggle").dropdown()

  $("[data-toggle=tooltip]").tooltip()

  $("a.open-in-new-tab").click ->
    window.open(this.href)
    false

  $('.datepicker').datepicker({
    format: 'yyyy-mm-dd',
    lang: $('html').attr('lang')
  })

  add_sign_for_required_field = (el) ->
    label = $("label[for='" + $(el).attr("id") + "']")
    l = label.html()
    if l && l[l.length-1]!=BaseRails5.requred_field_sign
      label.html(l+" "+BaseRails5.requred_field_sign)

  # add asterisk to label when the field is required
  $("input[required='required']").each ->
    add_sign_for_required_field(this)

  $("textarea[required='required']").each ->
    add_sign_for_required_field(this)

  $("select[required='required']").each ->
    add_sign_for_required_field(this)


  $("#sign_in_navbar_button").click ->
    Turbolinks.visit($(this).data('href'))



$(document).on('turbolinks:load', ready)
