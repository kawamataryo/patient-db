# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# 郵便番号より住所自動入力
$ ->
  $("#address_zipcode").jpostal({
    # 111-1111と1111111のどちらの入力形式でも住所を自動入力してくれる
    postcode : [ "#address_zipcode" ],
    # 住所の入力場所
    address  : {
                  "#patient_address" : "%3%4%5"
    }
  })
