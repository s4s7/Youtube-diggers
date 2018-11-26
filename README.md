# アプリ名

### Youtube-diggers   
　　

# アプリの目的(解決したい課題)

### 現在Youtubeにおいて、質は高いのに再生回数やチャンネル登録者数が少ないために眠ってしまっている動画がある。この日の目を見ることなく埋もれている動画をみんなで掘り起こすのがこのアプリの目的
　　

# 問題が起きている理由

### Youtubeが一つの検索エンジンしか持っていない				
　　

# 解決方法	

### 動画のURLを一旦、youtube外に出して独自のアルゴリズムで、質は高いがこれまで評価されてこなかった動画が上位になる様に並び替える  
具体的には、  
①ユーザーに好きな分野における質は高いが広く知られていない動画ベスト３を投稿してもらう  
②動画のURLからページに飛び、チャンネル登録数、投稿日、再生回数をスクレイピングする  
③スレイピングにより取ってきた各パラメータからポイントを計算する  
④ポイントの低い順もしくは高い順に並び替える  
⑤さらにその中で第三者が星５で評価してもらい、別ページで並び替える  
