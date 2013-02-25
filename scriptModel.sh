rails generate scaffold User login:string firstname:string lastname:string promo_id:integer school_id:integer city:string photo_url:string avatar_url:string uid:integer report_url:string  email:string

rails generate scaffold Group title:string parent_id:integer

rails generate scaffold Job user_id:integer group_id:integer job:string

rails generate scaffold Article title:string user_id:integer publication_date:datetime thumbnail:string nb_comments:integer content:text category:string status:integer score_id:integer event_id:integer

rails generate scaffold Event date:datetime user_id:integer score_id:integer

rails generate scaffold Tag title:string 

rails generate scaffold Author article_id:integer user_id:integer job:string 

rails generate scaffold Gossip text:string score_id:integer user_id:integer

rails generate scaffold CommentArticle user_id:integer content:text article_id:integer score_id:integer

rails generate scaffold CommentEvent user_id:integer content:text event_id:integer score_id:integer

rails generate scaffold CommentGossip user_id:integer content:text gossip_id:integer score_id:integer

rails generate scaffold Score score_pos:integer score_neg:integer

rails generate scaffold Vote score_id:integer user_id:integer value:integer

rails generate scaffold School title:string

rails generate scaffold Promo title:string school_id:integer