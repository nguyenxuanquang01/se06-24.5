# The Runtime

## The Runtime

Thời gian chạy là một bộ xử lý giao dịch đồng thời. Các giao dịch chỉ định trước các phần phụ thuộc dữ liệu của chúng và phân bổ bộ nhớ động là rõ ràng. Bằng cách tách mã chương trình khỏi trạng thái mà nó hoạt động, thời gian chạy có thể biên soạn quyền truy cập đồng thời. Các giao dịch truy cập tài khoản chỉ đọc được thực hiện song song trong khi các giao dịch truy cập tài khoản có thể ghi được tuần tự hóa. Thời gian chạy tương tác với chương trình thông qua một điểm nhập có giao diện được xác định rõ. Dữ liệu được lưu trữ trong tài khoản là một loại không rõ ràng, một mảng các byte. Chương trình có toàn quyền kiểm soát nội dung của nó.

Cấu trúc giao dịch chỉ định danh sách các khóa công khai và chữ ký cho các khóa đó và danh sách tuần tự các hướng dẫn sẽ hoạt động trên các trạng thái được liên kết với khóa tài khoản. Để giao dịch được cam kết, tất cả các hướng dẫn phải được thực hiện thành công; nếu có bất kỳ hủy bỏ, toàn bộ giao dịch không được cam kết.

#### Account Structure

Các tài khoản duy trì số dư của đèn và bộ nhớ theo chương trình cụ thể.

## Transaction Engine

Công cụ ánh xạ các khóa công khai đến các tài khoản và định tuyến chúng đến điểm nhập của chương trình.

## Excecution

Các giao dịch được thực hiện theo từng đợt và được xử lý trong một quy trình. TPU và TVU đi theo một con đường hơi khác. Thời gian chạy TPU đảm bảo rằng bản ghi PoH xảy ra trước khi bộ nhớ được cam kết.

Thời gian chạy TVU đảm bảo rằng xác minh PoH xảy ra trước khi thời gian chạy xử lý bất kỳ giao dịch nào.

![](https://github.com/nguyenxuanquang01/se06-24.5/blob/master/document/Solana/images/image9.JPG)

Ở giai đoạn thực thi, các tài khoản được tải không có phụ thuộc dữ liệu, vì vậy tất cả các chương trình có thể được thực thi song song.

Thời gian chạy thực thi các quy tắc sau:

1. Chỉ chương trình chủ sở hữu mới có thể sửa đổi nội dung của tài khoản. Điều này có nghĩa là vectơ dữ liệu khi gán được đảm bảo bằng 0.

2. Tổng số dư trên tất cả các tài khoản bằng nhau trước và sau khi thực hiện giao dịch.

3. Sau khi giao dịch được thực hiện, số dư của tài khoản chỉ đọc phải bằng số dư trước giao dịch.

4. Tất cả các hướng dẫn trong giao dịch được thực hiện nguyên tử. Nếu không thành công, tất cả các sửa đổi tài khoản sẽ bị loại bỏ.

Việc thực thi chương trình liên quan đến việc ánh xạ khóa công khai của chương trình tới một điểm nhập có một con trỏ đến giao dịch và một loạt các tài khoản được tải.