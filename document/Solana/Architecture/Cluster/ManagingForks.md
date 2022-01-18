### Managing Forks
- Sổ cái được phép phân chia tại các ranh giới vị trí. Cấu trúc dữ liệu kết quả tạo thành một cây được gọi là kho khối(blockstore). Khi trình xác thực thông dịch kho khối, nó phải 
duy trì trạng thái cho mỗi nhánh trong chuỗi. Chúng tôi gọi mỗi trường hợp là một nhánh hoạt động. Người xác nhận có trách nhiệm cân nhắc những fork đó, để cuối cùng nó có thể 
chọn một fork.
- Người xác nhận lựa chọn một ngã ba bằng cách gửi phiếu bầu cho người dẫn đầu vị trí trên ngã ba đó. Biểu quyết cam kết người xác nhận trong một khoảng thời gian được gọi là thời 
gian khóa. Người xác nhận không được phép bỏ phiếu về một nhánh khác cho đến khi thời hạn khóa đó hết hạn. Mỗi phiếu bầu tiếp theo trên cùng một nhánh rẽ sẽ tăng gấp đôi thời gian
khóa. Sau khi một số phiếu bầu được định cấu hình theo cụm ( hiện tại là 32 ), khoảng thời gian khóa đạt đến mức được gọi là thời gian khóa tối đa. Cho đến khi đạt đến mức khóa 
tối đa, người xác thực có tùy chọn đợi cho đến khi thời gian khóa kết thúc và sau đó bỏ phiếu cho một đợt phân nhánh khác. Khi nó bỏ phiếu trên một ngã ba khác, nó thực hiện một 
hoạt động được gọi là rollback, theo đó trạng thái quay ngược thời gian đến một trạm kiểm soát được chia sẻ và sau đó nhảy về phía đầu của ngã ba mà nó vừa bỏ phiếu. Khoảng cách 
tối đa mà một ngã ba có thể quay trở lại được gọi là độ sâu lùi . Độ sâu khôi phục là số phiếu cần thiết để đạt được khóa tối đa.  Bất cứ khi nào người xác nhận bỏ phiếu, bất kỳ 
điểm kiểm tra nào vượt quá độ sâu khôi phục sẽ không thể truy cập được. Có nghĩa là, không có tình huống nào mà trình xác thực sẽ cần phải quay lại quá độ sâu của quá trình khôi 
phục. Do đó, nó có thể cắt bỏ một cách an toàn các ngã ba không thể truy cập và xóa tất cả các điểm kiểm tra vượt quá độ sâu khôi phục vào điểm kiểm tra gốc.

## Active Forks
- Một nhánh hoạt động giống như một chuỗi các điểm kiểm tra có chiều dài dài hơn ít nhất một lần so với độ sâu khôi phục. Fork ngắn nhất sẽ có chiều dài dài hơn độ sâu cuộn lùi chính xác một đoạn. Ví dụ:
- Các chuỗi sau đây là các nhánh đang hoạt động :

![image](https://user-images.githubusercontent.com/75937525/149903436-1d0f8cf4-c3d4-4222-a6d4-7e1e75d25862.png)


1. {4, 2, 1}
2. {5, 2, 1}
3. {6, 3, 1}
4. {7, 3, 1}

## Pruning and Squashing
- Người xác nhận có thể bỏ phiếu cho bất kỳ điểm kiểm tra nào trong cây. Trong sơ đồ trên, đó là mọi nút ngoại trừ các lá của cây. Sau khi bỏ phiếu, trình xác nhận sẽ lược bỏ các nút phân nhánh từ một khoảng cách xa hơn độ sâu khôi phục và sau đó tận dụng cơ hội để giảm thiểu việc sử dụng bộ nhớ của nó bằng cách thu gọn bất kỳ nút nào mà nó có thể đưa vào thư mục gốc.
- Bắt đầu từ ví dụ trên, với độ sâu hồi lưu là 2, hãy xem xét một phiếu bầu cho 5 so với một phiếu cho 6. Đầu tiên, một phiếu bầu cho 5:

![image](https://user-images.githubusercontent.com/75937525/149903769-77056327-88de-4687-89d5-3b041b566ea8.png)

- Gốc mới là 2 và bất kỳ nhánh nào đang hoạt động không phải là con của 2 sẽ bị cắt bớt.

Ngoài ra, một phiếu bầu cho 6:

![image](https://user-images.githubusercontent.com/75937525/149903918-88b02b11-0ac2-44a5-9484-2efbe0884b23.png)

- Cây vẫn có gốc là 1, vì nhánh hoạt động bắt đầu từ 6 chỉ cách gốc 2 điểm kiểm tra.
