# README
+ rails _7.0.5_ new 更新
  
# users table   
|Column|Type|Option|   
| :--: | :--: | :--: |   
| name| string | null: false |
| username| string | null: false |
| email | string | null: false, unique: true |   
| encrypted_password | string | null: false | 

 + has_many: post
 + has_many: comment

# posts table  
  
| Column | Type | Option |   
| :--: | :--: | :--: |   
| title | string | null: false |  
| detail | text | null: false | 
| user | references | null: false,foreign_key:true  |   

 + has_many: comments


# comments table   

| Column | Type | Option |   
| :--: | :--: | :--: |   
| content | text | null: false | 
| post | references | null: false,foreign_key:true  | 
| user | references | null: false,foreign_key:true  |  