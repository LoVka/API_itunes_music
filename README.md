# R&R Music test task

Server API (first part of the task).

See also: [Frontend client](https://github.com/lovka/itunes_music_client)

## Task description

### 1. Create rake-task saving artist and albums from [Itunes API](https://affiliate.itunes.apple.com/resources/documentation/itunes-store-web-service-search-api/)
    - Search artist by name ( example https://itunes.apple.com/search?term=abba&entity=musicArtist )
    - If artist found save in model Artist (name, itunes_id)
    - Fetch all albums by Artist itunes_id (example https://itunes.apple.com/lookup?id=372976&entity=album )
    - Save artist albums in model Album (name, artwork_url_100, belongs_to: artist)
You can use ActiveRecord, but Mongoid is preferable.

### 2. Create simple API
    - Fetching all artists
    - Fetching albums by artist

### 3. Create EmberCli App to work with API (optional, but very preferable)
    - Show all artists list
    - Click on artist should send user on page with all albums(name and artwork) of artist
UI doesn't matter.

### Create 2 separate repositories in GitHub:
    - API and fetching data from Itunes
    - Frontend client

## Usage

Import artist

```shell
$ rake itunes ARTIST=Abba
$ rake itunes ARTIST=Muse
```

Srart API server

```shell
$ rails s
```

Fetching all artists

```shell
$ curl http://localhost:3000/api/artists
{"data":[{"type":"artists","id":372976,"attributes":{"name":"ABBA"}},{"type":"artists","id":1093360,"attributes":{"name":"Muse"}}]}
```

Fetching albums by artist

```shell
$ curl http://localhost:3000/api/albums?artist_id=372976
{"data":[{"type":"albums","id":850009855,"attributes":{"name":"Gold: Greatest Hits","thumb":"http://is1.mzstatic.com/image/thumb/Music4/v4/95/20/8f/95208fc6-629f-6ac9-c8db-69357b9b69d2/source/100x100bb.jpg"}},{"type":"albums","id":402574,"attributes":{"name":"20th Century Masters - The Millennium Collection: The Best of ABBA","thumb":"http://is1.mzstatic.com/image/thumb/Music/v4/30/3c/2b/303c2b79-92c3-56e3-4c46-e4115a27daab/source/100x100bb.jpg"}},{"type":"albums","id":510714434,"attributes":{"name":"More ABBA Gold: More ABBA Hits","thumb":"http://is1.mzstatic.com/image/thumb/Music/v4/09/a2/76/09a2765c-8c2a-9dee-6774-4a95a7f1e437/source/100x100bb.jpg"}},{"type":"albums","id":849980885,"attributes":{"name":"The Visitors","thumb":"http://is4.mzstatic.com/image/thumb/Music4/v4/c6/a5/d9/c6a5d9da-f773-1671-4e81-79dba5c4a4a8/source/100x100bb.jpg"}},{"type":"albums","id":849997662,"attributes":{"name":"Oro: Grandes Exitos","thumb":"http://is1.mzstatic.com/image/thumb/Music4/v4/72/c6/1c/72c61c09-d7d3-a92a-21d7-63e5d2c65ae4/source/100x100bb.jpg"}},{"type":"albums","id":850004323,"attributes":{"name":"Arrival","thumb":"http://is2.mzstatic.com/image/thumb/Music/v4/c1/85/5e/c1855e4b-70ca-4fab-5333-a4423c45aea3/source/100x100bb.jpg"}},{"type":"albums","id":849987267,"attributes":{"name":"Voulez-Vous","thumb":"http://is2.mzstatic.com/image/thumb/Music2/v4/a1/23/13/a123135a-5d25-8423-7998-a62a6b597147/source/100x100bb.jpg"}},{"type":"albums","id":849974489,"attributes":{"name":"ABBA","thumb":"http://is4.mzstatic.com/image/thumb/Music4/v4/93/f8/b3/93f8b36d-64c5-fb2d-7ad1-663ba80194c0/source/100x100bb.jpg"}},{"type":"albums","id":898033938,"attributes":{"name":"Live At Wembley Arena","thumb":"http://is5.mzstatic.com/image/thumb/Music4/v4/8f/81/58/8f8158de-f17a-9ba4-a069-ae87a686a508/source/100x100bb.jpg"}},{"type":"albums","id":376283,"attributes":{"name":"Thank You for the Music","thumb":"http://is3.mzstatic.com/image/thumb/Music/v4/7d/3b/9a/7d3b9a89-a037-6fba-529e-9fab6cd14a65/source/100x100bb.jpg"}},{"type":"albums","id":849970632,"attributes":{"name":"The Album","thumb":"http://is3.mzstatic.com/image/thumb/Music6/v4/ba/c4/40/bac440c1-3145-8b19-0b08-714b416c1778/source/100x100bb.jpg"}},{"type":"albums","id":850014884,"attributes":{"name":"Super Trouper","thumb":"http://is1.mzstatic.com/image/thumb/Music/v4/d7/06/52/d70652ad-5a8a-8e5f-88d6-cd51c927147b/source/100x100bb.jpg"}},{"type":"albums","id":850027564,"attributes":{"name":"Waterloo (Deluxe Edition)","thumb":"http://is4.mzstatic.com/image/thumb/Music/v4/88/56/8a/88568a0c-45bb-abd9-cc49-599234aa7764/source/100x100bb.jpg"}},{"type":"albums","id":849983259,"attributes":{"name":"Waterloo","thumb":"http://is4.mzstatic.com/image/thumb/Music6/v4/aa/a4/83/aaa4834e-c85f-5885-6fb2-dc2e907fa3cc/source/100x100bb.jpg"}},{"type":"albums","id":1604980,"attributes":{"name":"ABBA: On and On","thumb":"http://is4.mzstatic.com/image/thumb/Music/v4/83/de/d4/83ded4a4-ff12-61ac-a6a7-df4c44b1767d/source/100x100bb.jpg"}},{"type":"albums","id":521207959,"attributes":{"name":"The Visitors (Deluxe Edition)","thumb":"http://is1.mzstatic.com/image/thumb/Music/v4/8d/8c/47/8d8c4735-5977-8267-9a49-96066e9aea64/source/100x100bb.jpg"}},{"type":"albums","id":894146945,"attributes":{"name":"På Svenska","thumb":"http://is2.mzstatic.com/image/thumb/Music4/v4/86/ad/24/86ad246c-64e5-800c-cc56-be4e4cb8272b/source/100x100bb.jpg"}},{"type":"albums","id":136687762,"attributes":{"name":"Chronicles","thumb":"http://is4.mzstatic.com/image/thumb/Music/v4/ef/aa/73/efaa732c-68d3-0128-e725-42d5c1a97a67/source/100x100bb.jpg"}},{"type":"albums","id":524786155,"attributes":{"name":"The Essential Collection","thumb":"http://is5.mzstatic.com/image/thumb/Music/v4/6c/b7/65/6cb76502-f6a2-8cf4-ed0e-f5599fa1ef80/source/100x100bb.jpg"}},{"type":"albums","id":727349843,"attributes":{"name":"Ring Ring (Deluxe Edition)","thumb":"http://is2.mzstatic.com/image/thumb/Music6/v4/f8/81/a4/f881a403-0dd0-d73b-c093-f05290d52fea/source/100x100bb.jpg"}},{"type":"albums","id":850020544,"attributes":{"name":"Ring Ring","thumb":"http://is1.mzstatic.com/image/thumb/Music4/v4/f9/72/81/f9728102-05ec-ca6d-56d4-1599cce32db3/source/100x100bb.jpg"}},{"type":"albums","id":938507057,"attributes":{"name":"Abba - The Collection","thumb":"http://is1.mzstatic.com/image/thumb/Music1/v4/cb/56/a4/cb56a43e-a0a6-2e78-ae2f-c45f349686f3/source/100x100bb.jpg"}}]}
```
