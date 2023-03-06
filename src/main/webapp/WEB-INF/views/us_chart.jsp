<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<body>
    <a href="/home">홈으로</a>
    <a href="/kor_chart">KOR CHART</a>  
    <button id="prev-page" name="prev-page">이전</button>
    <button id="next-page" name="next-page">다음</button>
    <div id="chart"></div>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>





$(document).ready(function() {    
    var apiKey = "8216eb699ed2bd015dacdee072057fc2"; // Last.fm API key
    var tracksPerPage = 20; // Number of tracks per page
    var currentPage = 1; // Current page number
    
    function loadTracks(page) {
        $.ajax({ // request information
            url: 'https://ws.audioscrobbler.com/2.0/',
            data: {
                method: 'chart.gettoptracks',
                page: page,
                api_key: apiKey,
                format: 'json',
                limit: tracksPerPage
            },
            dataType: 'json',
            success: function(response) {
                var tracks = response.tracks.track;
                var requests = []; // 비동기 호출 배열 선언
                $.each(tracks, function(index, track) {
                    var request = $.ajax({
                    url: 'https://ws.audioscrobbler.com/2.0/',
                    data: {
                        method: 'track.getInfo',
                        api_key: apiKey,
                        artist: track.artist.name,
                        track: track.name,
                        format: 'json'
                    },
                    dataType: 'json',
                    });
                    requests.push(request);
                });
                $.when.apply($, requests).done(function() { // 모든 비동기 호출이 완료될 때까지 기다림
                    var html = '';
                    $.each(arguments, function(index, response) {
                    var track = response[0].track;
                    html += '<div class="track">' +
                        '<span class="rank">' + ((page-1)*20 + index + 1) + '&nbsp' + '</span>' +
                        '<span class="title">' + track.name + '&nbsp//&nbsp' + '</span>' +
                        '<span class="artist">' + track.artist.name + '</span>' +
                        '</div>';
                    });
                    $('#chart').html(html);
                });
            }                
        })
    }
    
    // Load the first page of tracks
    loadTracks(currentPage);
    
    // Add click handlers to the pagination buttons
    $('#prev-page').click(function() {
        if (currentPage > 1) {
            currentPage--;
            $('#chart').empty();
            loadTracks(currentPage);
        }
    });
    $('#next-page').click(function() {
        currentPage++;
        $('#chart').empty();
        loadTracks(currentPage);
    });
});



// $(document).ready(function() {
//   var apiKey = "8216eb699ed2bd015dacdee072057fc2";
//   $.ajax({
//     url: 'https://ws.audioscrobbler.com/2.0/',
//     data: {
//       method: 'chart.gettoptracks',
//       api_key: apiKey,
//       format: 'json',
//       limit: 99
//     },
//     dataType: 'json',
//     success: function(response) {
//       var tracks = response.tracks.track;
//       var requests = []; // 비동기 호출 배열 선언
//       $.each(tracks, function(index, track) {
//         var request = $.ajax({
//           url: 'https://ws.audioscrobbler.com/2.0/',
//           data: {
//             method: 'track.getInfo',
//             api_key: apiKey,
//             artist: track.artist.name,
//             track: track.name,
//             format: 'json'
//           },
//           dataType: 'json',
//         });
//         requests.push(request);
//       });
//       $.when.apply($, requests).done(function() { // 모든 비동기 호출이 완료될 때까지 기다림
//         var html = '';
//         $.each(arguments, function(index, response) {
//           var track = response[0].track;
//           html += '<div class="track">' +
//             '<span class="rank">' + (index+1) + '&nbsp' + '</span>' +
//             '<span class="title">' + track.name + '&nbsp//&nbsp' + '</span>' +
//             '<span class="artist">' + track.artist.name + '</span>' +
//             '</div>';
//         });
//         $('#chart').html(html);
//       });
//     }
//   });
// });





// $(document).ready(function() {    
//     var apiKey = "8216eb699ed2bd015dacdee072057fc2";  
//     $.ajax({ 
//         url: 'https://ws.audioscrobbler.com/2.0/',
//         data: {
//             method: 'chart.gettoptracks',
//             api_key: apiKey,
//             format: 'json',
//             limit: 10
//         },
//         dataType: 'json',
//         success: function(response) {   
//             var tracks = response.tracks.track;          
//             $.each(tracks, function(index, track) {
//                 $.ajax({ 
//                     url: 'https://ws.audioscrobbler.com/2.0/',
//                     data: {
//                         method: 'track.getInfo',
//                         api_key: apiKey,
//                         artist: track.artist.name,
//                         track: track.name,
//                         format: 'json'
//                     },
//                     dataType: 'json',
//                     success: function(response) {
//                         var html = '<div class="track">' +
//                                    '<span class="rank">' + (index+1) + '&nbsp' + '</span>' +
//                                    '<span class="title">' + track.name + '&nbsp//&nbsp' + '</span>' +
//                                    '<span class="artist">' + track.artist.name + '</span>' +
//                                    '</div>';
//                             $('#chart').append(html);
//                             console.log(html);
//                     }
//                 });
//             });
//         }
//     });
// });





//     $(document).ready(function() {    
//     var apiKey = "8216eb699ed2bd015dacdee072057fc2";  
//     $.ajax({ 
//         url: 'https://ws.audioscrobbler.com/2.0/',
//         data: {
//             method: 'chart.gettoptracks',
//             api_key: apiKey,
//             format: 'json',
//             limit: 10
//         },
//         dataType: 'json',
//         success: function(response) {   
//             var tracks = response.tracks.track;          
//             $.each(tracks, function(index, track) {
//                 $.ajax({ 
//                     url: 'https://ws.audioscrobbler.com/2.0/',
//                     data: {
//                         method: 'track.getInfo',
//                         api_key: apiKey,
//                         artist: track.artist.name,
//                         track: track.name,
//                         format: 'json'
//                     },
//                     dataType: 'json',
//                     success: function(response) {
//                         var html = '<span class="track">' +
//                                    '<span class="rank">' + (index+1) + '&nbsp' + '</span>' +
//                                    '<span class="title">' + track.name + '&nbsp//&nbsp' + '</span>' +
//                                    '<span class="artist">' + track.artist.name + '</span>' +
//                                    '</span>' + '<br>';
//                             $('#chart').append(html);
//                     }
//                 });
//             });
//         }
//     });
// });
</script>