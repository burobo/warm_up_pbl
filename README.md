## 開発環境構築
1. イメージ作成
```docker-compose build```

2. コンテナ作成・起動
```docker-compose up -d```

3. DB作成
```docker-compose exec web rails db:create```

4. ブラウザでアクセス
http://localhost:3000/

5. コンテナ停止
```docker-compose stop```

※コンテナ起動（既にコンテナ作成済の場合）
```docker-compose start```
