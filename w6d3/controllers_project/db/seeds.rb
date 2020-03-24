# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#title, image_url, artist_id
Artwork.destroy_all
User.destroy_all
ArtworkShare.destroy_all

artworks = Artwork.create 
    (
        [
            {
                title: 'bottle',
                image_url: 'www.bottle.com',
                artist_id: 1
            },
            {
                title: 'fruit in a bowl',
                image_url: 'www.stilllife.com',
                artist_id: 2
            },
            {
                title: 'can',
                image_url: 'www.can.com',
                artist_id: 1
            },       
            {
                title: 'unfinished artwork',
                image_url: 'www.theend.com',
                artist_id: 4
            }, 
            {
                title: 'the 5th',
                image_url: 'www.somuchart.org',
                artist_id: 5
            }, 
        ]
    )

artist = User.create ([
    {username: 'happy_paintbrush'}, 
    {username: 'art_depreciator'},
    {username: 'dry_inkwell'}, 
    {username: 'solitary_canvas'}, 
    {username: 'faded_painting'}])

shares = ArtworkShare.create 
(   
    [
    {
        artwork_id: 1,
        viewer_id: 7
    },
    {
        artwork_id: 2,
        viewer_id: 7
    },
    {
        artwork_id: 3,
        viewer_id: 7
    },
    {
        artwork_id: 2,
        viewer_id: 2
    },
    {
        artwork_id: 3,
        viewer_id: 8
    },
    {
        artwork_id: 4,
        viewer_id: 8
    },
    {
        artwork_id: 5,
        viewer_id: 8
    },
    {
        artwork_id: 5,
        viewer_id: 9
    },
    {
        artwork_id: 1,
        viewer_id: 9
    },
    {
        artwork_id: 2,
        viewer_id: 9
    },
    {
        artwork_id: 1,
        viewer_id: 10
    },
    {
        artwork_id: 3,
        viewer_id: 10
    },
    {
        artwork_id: 4,
        viewer_id: 10
    },
    {
        artwork_id: 1,
        viewer_id: 11
    },
    {
        artwork_id: 3,
        viewer_id: 11
    },
    {
        artwork_id: 5,
        viewer_id: 11
    }
]
                        )