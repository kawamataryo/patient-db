#login認証画面でredirectした際のmodal表示
ready = ->
    signInBtn = $('#signin-btn')
    formAlert = $('#form-alert')
    formNotice = $('#form-notice')
    if formNotice.get(0) or formAlert.get(0)
        signInBtn.click()

# ページ切り替え時（初回ページも対象）
$(document).on('turbolinks:load', ready)
