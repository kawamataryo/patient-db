#------------------------------------------
#home hover action
#------------------------------------------
ready = ->
    bgbox = $('#body-wrap')
    cardP = $('#card-patient')
    cardH = $('#card-history')
    cardC = $('#card-chart')
    titile = $('#home-title')
    imageUrlP = "url(" + image_path('patient-bg.jpg') + ")"
    imageUrlH = "url(" + image_path('history-bg.jpg') + ")"
    imageUrlC = "url(" + image_path('chart-bg.jpg') + ")"
    cardP.mouseover ->
        bgbox.css
            "background-image": imageUrlP
            "opacity" : 1
        titile.css
            "color" : "#fff"
    cardP.mouseout ->
        bgbox.css
            "opacity" : 0
        titile.css
            "color" : "#000"
    cardH.mouseover ->
        bgbox.css
            "background-image": imageUrlH
            "opacity" : 1
        titile.css
            "color" : "#fff"
    cardH.mouseout ->
        bgbox.css
            "opacity" : 0
        titile.css
            "color" : "#000"
    cardC.mouseover ->
        bgbox.css
            "background-image": imageUrlC
            "opacity" : 1
        titile.css
            "color" : "#fff"
    cardC.mouseout ->
        bgbox.css
            "opacity" : 0
        titile.css
            "color" : "#000"

# ページ切り替え時（初回ページも対象）
$(document).on('turbolinks:load', ready)
# ページ遷移前
$(document).on('turbolinks:request-start', ready)
