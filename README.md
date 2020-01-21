# Patient DB
Management of patient information for acupuncture clinics.

![スクリーンショット 2020-01-22 6 13 29](https://user-images.githubusercontent.com/11070996/72843924-dc05df00-3cde-11ea-80e1-ecce5ef8552a.png)


## Demo site.
https://patient-db.herokuapp.com/

```
email: hoge@hoge.com
password:  hogehoge
```

※ Because Deployed to heroku's free plan, First access is slow.

## Usage

Setup ruby version to 2.4.1.

```
rbenv install 2.4.1
rbenv local 2.4.1
```

Install gems.

```
bundle i
```

Import demo data to db.

```
bundle exec rake db:seed
```

Server start and Access http://localhost:3000.

```
bundle exec rails s
```

Login with the following email and password.

```
email: hoge@hoge.com
password: hogehoge
```

## Feature
- Authentication and Authorization user
- Patient data CRUD
- Patient history data CRUD
- Sales charts
- CSV export

## Screenshots
#### Menu page.
![スクリーンショット 2020-01-22 6 15 10](https://user-images.githubusercontent.com/11070996/72843950-e58f4700-3cde-11ea-99f1-ac83cc2d7640.png)
#### Patients index page.
![スクリーンショット 2020-01-22 6 22 01](https://user-images.githubusercontent.com/11070996/72844332-9f86b300-3cdf-11ea-92d4-7d964860c4b0.png)
#### History new page.
![スクリーンショット 2020-01-22 6 22 24](https://user-images.githubusercontent.com/11070996/72844344-a57c9400-3cdf-11ea-8228-5cc5493bb330.png)
#### Graph page.
![スクリーンショット 2020-01-22 6 14 40](https://user-images.githubusercontent.com/11070996/72843921-d9a38500-3cde-11ea-80ca-3d0ff528bd8a.png)

