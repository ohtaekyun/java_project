<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<body>
    <a href="/home">홈으로</a>
    <a href="/us_chart">US CHART</a>
    <div id="chart"></div>    
</body>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
    $(document).ready(function() {    
    var apiKey = "8216eb699ed2bd015dacdee072057fc2"; // Last.fm API key  
    $.ajax({ // request information
        url: 'https://ws.audioscrobbler.com/2.0/',
        data: {
            method: 'library.getArtists',
            format: 'json',
            user: 'Komet',
            api_key: apiKey
        },
        dataType: 'json',
        success: function(response) {
            console.log(response)            
            var tracks = response.tracks.track; // track list
            var sortedTracks = tracks.map(function(track, index) {
                return { track: track, index: index };
            }).sort(function(a, b) {
                return a.index - b.index;
            }).map(function(obj) {
                return obj.track;
            });
            $.each(sortedTracks, function(index, track) { // each track process
                $.ajax({ // track information request
                    url: 'https://ws.audioscrobbler.com/2.0/',
                    data: {
                        method: 'track.getInfo',
                        api_key: apiKey,
                        artist: track.artist.name,
                        track: track.name,
                        format: 'json'
                    },
                    dataType: 'json',
                    success: function(response) {
                        var html = '<span class="track">';
                            html += '<span class="rank">' + (index+1) + '&nbsp' + '</span>';
                            html += '<span class="title">' + track.name + '&nbsp' + '</span>';
                            html += '<span class="artist">' + track.artist.name + '</span>'; 
                            html += '</span>' + '<br>';
                            $('#chart').append(html);
                    }
                });
            });
        }
    });
});
</script>