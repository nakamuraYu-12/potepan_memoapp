require "csv"

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i 

#新規csvに書き込みする処理
def write_new(name, content)
    CSV.open("#{name}.csv","w") do |csv|
        content.split("\n").each do |line|
            csv << [line]
        end
    end
end

#既存csvに書き込みする処理
def write_add(name, content)
    CSV.open("#{name}.csv","a") do |csv|
        content.split("\n").each do |line|
            csv << [line]
        end
    end
end

#既存csvを読み込み出力する処理
def read_memo(name)
    memo_text = CSV.read("#{name}.csv")
    return memo_text
end

#1入力時(新規csv書き込み)
if memo_type == 1
    puts "拡張子を除いたファイルを入力してください"
    file_name = gets.chomp

    p "メモしたい内容を記載してください"
    p "完了したらCtrl+Dを押します"
    memo_content = STDIN.read.chomp
    #メソッド名が誤っていたため修正しました
    write_new(file_name,memo_content)

#2入力時(既存csv書き込み)
elsif memo_type == 2
    puts "書き込みたいファイル名を指定してください"
    file_name = gets.chomp

    puts "メモしたい内容を記載してください"
    puts "完了したらCtrl+Dを押します"
    puts "【メモの内容】"
    puts read_memo(file_name)
    memo_content = STDIN.read.chomp
    
    write_add(file_name,memo_content)

#それ以外の数字を入力された時
else
    puts "1か2を入力してください"
end

