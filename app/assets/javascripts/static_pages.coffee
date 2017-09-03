# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
    bgbox = $('#body-wrap')
    cardP = $('#card-patient')
    cardH = $('#card-history')
    cardC = $('#card-chart')
    imageUrlP = "url(" + image_path('patient-bg.jpg') + ")"
    imageUrlH = "url(" + image_path('history-bg.jpg') + ")"
    imageUrlC = "url(" + image_path('chart-bg.jpg') + ")"
    cardP.mouseover ->
        bgbox.css
            "background-image": imageUrlP
    cardP.mouseout ->
        bgbox.css
            "background-image": ''
    cardH.mouseover ->
        bgbox.css
            "background-image": imageUrlH
    cardH.mouseout ->
        bgbox.css
            "background-image": ''
    cardC.mouseover ->
        bgbox.css
            "background-image": imageUrlC
    cardC.mouseout ->
        bgbox.css
            "background-image": ''

