class Search
  init: ->
    this.init_pagination()

  load_thumbs: ->
    $.each $('.search_result .pending'), (i, e) ->
      id = $(e).parents('.search_result').data('result_id')
      $.get '/query/' + gon.query_id + '/results/' + id + '.json', (r) ->
        $(e).replaceWith($('<img/>').attr('src', r.image_url))
  init_pagination: ->
    $('#pagination a').click (e) ->
      e.preventDefault()

      $this = $(this)
      spinner    = $('#loading_spinner')
      pagination = $('#pagination')

      $.ajax
        url: $this.attr('href')
        dataType: 'script'
        beforeSend: ->
          spinner.show()
          pagination.hide()
        success: (r) ->
          spinner.hide()
          pagination.show()
          eval r

if $('body').hasClass('search')
  s = new Search
  s.init()
