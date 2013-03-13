(function() {
  var toto = new Toto('/service');
  
  function updateCount() {
    toto.request("count", {}).then(function(response){
      $('#output').append($('<p>').text(response.count));
    });
  }

  function updateUI() {
    if (toto.sessionID()) {
      $('#unauth').addClass('hidden');
      $('#logged-in').removeClass('hidden');
      updateCount();
    } else {
      $('#unauth').removeClass('hidden');
      $('#logged-in').addClass('hidden');
    }
  }
  $('#login').click(function(){
    toto.request('account.login', {'user_id': $('#email').val(), 'password': $('#pass').val()}).then(function(){
      updateUI();
    }).error(function(e){
      $('.alert').removeClass('hidden').text(e.value);
    })
  });
  $('#signup').click(function(){
    toto.request('account.create', {'user_id': $('#email').val(), 'password': $('#pass').val()}).then(function(){
      updateUI();
    }).error(function(e){
      $('.alert').removeClass('hidden').text(e.value);
    })
  });
  $('#count').click(updateCount);
  $('#logout').click(function(){
    toto.logout();
    updateUI();
  });
  updateUI();
})();
