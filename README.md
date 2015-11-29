# Structure of DataBase

## User
### association

```
has_many :prototypes, likes, comments
```

### table
- name
- email
- password
- image
- profile
- position
- occupation


## Prototype
### association

```
has_many :captured_images, comments, likes
has_and_belongs_to_many :tags
```

### table
- name
- catch_copy
- concept

## CapturedImage
### association

```
belongs_to :prototype
```

### table
- tag_image
- prototype_id


## Like
### association

```
belongs_to :user, :prototype
```

### table
- user_id
- prototype_id

## Tag
### association

```
hash_and_belongs_to_many :prototypes
```

### table
- tag_name


## Comment
### association

```
belongs_to :user, :prototype
```

### table
- comment
- user_id
- prototype_id


## prototypes_and_tags
 no model

### table
- tag_id
- prototype_id
