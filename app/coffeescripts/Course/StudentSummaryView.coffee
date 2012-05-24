define [
  'jquery'
  'Backbone'
  'analytics/jst/course_student_summary'
  'analytics/compiled/Course/CountBar'
  'analytics/compiled/Course/TardinessBar'
  'analytics/compiled/graphs/colors'
], ($, Backbone, template, CountBar, TardinessBar, colors) ->

  class StudentSummaryView extends Backbone.View
    tagName: 'tr'

    initialize: ->
      @model.on 'change', @render
      @render()

    render: =>
      # replace $el with new rendering of template
      oldEl = @$el
      @$el = $ template @model.toJSON()
      oldEl.replaceWith @$el

      if summary = @model.get 'summary'
        # update activity and assignments graphs from student summary
        @pageViews = new CountBar @$('.page_views'), 'page views'
        @participations = new CountBar @$('.participations'), 'participations'
        @tardiness = new TardinessBar @$('.assignments')

        @pageViews.show summary.pageViews
        @participations.show summary.participations
        @tardiness.show summary.tardinessBreakdown

      this
