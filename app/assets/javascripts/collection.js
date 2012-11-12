
$(document).ready(function(){

var submit_edit_query = function(){
    if($.trim($('#artist_search_text').val()) != "" && $.trim($('#album_search_text').val()) != ""){
        $.ajax({
            url: 'http://ws.audioscrobbler.com/2.0/',
            data: {method: "album.getinfo", artist: $.trim($('#artist_search_text').val()), album: $.trim($('#album_search_text').val()), api_key: "044f387480aab36c39d1df409ab535a6", format: "json", autocorrect: '1'},
            dataType: 'json',
            success: function(rcv_data){
                $("#search_results").html("");
                $.each(rcv_data,function(){
                    var album_html =
                        "<li class='album_li'>"+
                        "<img src="+this.image[2]['#text']+"><div class='album_wrap'>"+
                        "<b>"+this.artist+"</b><br>"+this.name+
                        '<input type="hidden" class="hid_artist" value="'+this.artist+'" />'+
                        '<input type="hidden" class="hid_album" value="'+this.name+'" />'+
                        "<input type='hidden' class='hid_mbid' value='"+this.mbid+"' />"+
                        "<input type='hidden' class='hid_img_url' value='"+this.image[2]['#text']+"' />"+
                        "<a href='#'>+</a></div></li>";
                    $("#search_results").append(album_html);
                });
                //console.log(rcv_data);
            }
        });
    } else if($.trim($('#artist_search_text').val()) != ""){
        $.ajax({
            url: 'http://ws.audioscrobbler.com/2.0/',
            data: {method: "artist.gettopalbums", artist: $.trim($('#artist_search_text').val()), api_key: "044f387480aab36c39d1df409ab535a6", format: "json", autocorrect: '1', limit: $('#edit_limit')[0].value},
            dataType: 'json',
            success: function(rcv_data){
                $("#search_results").html("");
                $.each(rcv_data.topalbums.album,function(){
                    var album_html =
                        "<li class='album_li'>"+
                        "<img src="+this.image[2]['#text']+"><div class='album_wrap'>"+
                        "<b>"+this.artist.name+"</b><br>"+this.name+
                        '<input type="hidden" class="hid_artist" value="'+this.artist.name+'" />'+
                        '<input type="hidden" class="hid_album" value="'+this.name+'" />'+
                        "<input type='hidden' class='hid_mbid' value='"+this.mbid+"' />"+
                        "<input type='hidden' class='hid_img_url' value='"+this.image[2]['#text']+"' />"+
                        "<a href='#'>+</a></div></li>";
                    $("#search_results").append(album_html);
                });
                //console.log(rcv_data.topalbums.album);
            }
        });
    } else if($.trim($('#album_search_text').val()) != ""){
        $.ajax({
            url: 'http://ws.audioscrobbler.com/2.0/',
            data: {method: "album.search", album: $.trim($('#album_search_text').val()), api_key: "044f387480aab36c39d1df409ab535a6", format: "json", limit: $('#edit_limit')[0].value},
            dataType: 'json',
            success: function(rcv_data){
                $("#search_results").html("");
                $.each(rcv_data.results.albummatches.album,function(){
                    var album_html =
                        "<li class='album_li'>"+
                        "<img src="+this.image[2]['#text']+"><div class='album_wrap'>"+
                        "<b>"+this.artist+"</b><br>"+this.name+
                        '<input type="hidden" class="hid_artist" value="'+this.artist+'" />'+
                        '<input type="hidden" class="hid_album" value="'+this.name+'" />'+
                        "<input type='hidden' class='hid_mbid' value='"+this.mbid+"' />"+
                        "<input type='hidden' class='hid_img_url' value='"+this.image[2]['#text']+"' />"+
                        "<a href='#'>+</a></div></li>";
                    $("#search_results").append(album_html);
                });
                //console.log(rcv_data.results.albummatches.album);
            }
        });
    }
}


$('#edit_search_btn').click( function(){ submit_edit_query(); });
$('#album_search_text, #artist_search_text').keypress(function(e) {
    if(e.which == 13) {
        $(this).blur();
        $('#edit_search_btn').focus().click();
    }
});


$('#search_results').on("click", ".album_li .album_wrap a", function(){
    var var_art = $(this).parent().find('.hid_artist')[0].value;
    var var_alb = $(this).parent().find('.hid_album')[0].value;
    var var_mbi = $(this).parent().find('.hid_mbid')[0].value;
    var var_img = $(this).parent().find('.hid_img_url')[0].value;
    var current_li = $(this).parents('.album_li');
    $.ajax({
        type: 'POST',
        data: {artist: var_art, album: var_alb, mbid: var_mbi, img_url: var_img },
        url: '../album/create',
        success: function(){
            console.log(var_alb);
            console.log('POST SUCCESS');
            var is_duplicate = false;
            $('#user_shelf .album_li .album_wrap').each(function() {
                if($(this).find('.hid_mbid')[0].value == var_mbi) {
                    is_duplicate = true;
                    return false;
                }
            });
            if(!is_duplicate){
                //console.log($(current_li).clone());
                if($('#user_shelf .album_li').length > 0){
                    $('#user_shelf .album_li').first().before($(current_li).clone().hide());
                    $('#user_shelf .album_li .album_wrap a').first().html('-');
                    $('#user_shelf .album_li').first().fadeIn();
                } else{
                    $('#user_shelf').append($(current_li).clone().hide());
                    $('#user_shelf .album_li').first().fadeIn();
                }
            }
        }
    });
});

$('#user_shelf').on("click", ".album_li .album_wrap a", function(){
    var current_li = $(this).parents('.album_li');
    $.ajax({
        type: 'DELETE',
        data: { mbid: $(this).parent().find('.hid_mbid')[0].value },
        url: '../album/destroy',
        success: function(){
            console.log('DELETE SUCCESS');
            $(current_li).fadeOut('slow', function(){ $(this).remove(); });
        }
    });
});


});
