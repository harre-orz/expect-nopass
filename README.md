# nopass

ssh や scp でパスワードを環境変数に設定することでログインできるスクリプト

## 使い方

```
export LOGIN_PASSWORD=hoge
nopass ssh user@example.com
nopass ssh user@example.com ls
nopass scp file user@example.com:file
echo ls | nopass ssh user@example.com bash -s
```

