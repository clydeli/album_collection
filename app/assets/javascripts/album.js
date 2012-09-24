
$(document).ready(function(){
    if($('#album_page_mbid').length != 0){
    $.ajax({
        url: 'http://ws.audioscrobbler.com/2.0/',
        data: {method: "album.getinfo", mbid: $('#album_page_mbid')[0].value, api_key: "044f387480aab36c39d1df409ab535a6", format: "json"},
        dataType: 'json',
        success: function(rcv_data){
            $.each(rcv_data,function(){
                $('#album_page_img').attr('src', this.image[2]['#text']);
                $('#album_info_div').append("<h4>Release Date: " + this.releasedate.slice(0, -7)+"</h4>");
                //$('#album_info_div').append("<b>Wiki: "+ this.wiki.content+"</b>");
                $('#album_info_div').append("<br><h4>Tracks:</h4>");
                $.each(this.tracks.track,function(index){
                    $('#album_info_div').append( "<li>"+(index+1)+"."+this.name+"</li>");
                });
                $('#album_info_div').append("");
            });
            console.log(rcv_data);
        }
    });
    }

});