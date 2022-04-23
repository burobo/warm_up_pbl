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

## Rails 関連コマンド

### モデル作成
- 注意：xxx は単数系にする
```
# ファイル生成
docker-compose exec web rails g model xxx(任意のモデル名)

# ファイル削除
docker-compose exec web rails d model xxx(任意のモデル名)
```

### マイグレーション作成
- 注意: xxx はマイグレーションの内容にする
```
# ファイル作成
docker-compose exec web rails g migration xxx

# ファイル削除
docker-compose exec web rails d migration xxx
```

### マイグレーション・ロールバック
```
# マイグレーション
docker-compose exec web rails db:migrate

# ロールバック
docker-compose exec web rails db:rollback
```

### コントローラ生成
- 注意: xxx は複数形にする
```
# ファイル生成
docker-compose exec web rails g controller xxx

# ファイル削除
docker-compose exec web rails d controller xxx
```