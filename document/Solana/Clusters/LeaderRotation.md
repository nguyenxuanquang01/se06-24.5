### Leader Rotation
- Tại bất kì thời điểm nhất định nào, một cụm chỉ mong đợi một trình xác thực tạo ra các mục nhập sổ cái. Bằng cách chỉ có một nhà lãnh đạo tại một thời điểm, tất cả các trình xác
thực đều có thể phát lại các bản sao giống hệt nhau của sổ cái. Tuy nhiên, hạn chế của chỉ một nhà lãnh đạo tại một thời điểm là một nhà lãnh đạo độc hại có khả năng kiểm duyệt 
các phiếu bầu và giao dịch. Vì không thể phân biệt được việc kiểm duyệt với việc mạng bỏ các gói tin, cụm không thể chỉ chọn một nút duy nhất để giữ vai trò lãnh đạo vô thời hạn. 
Thay vào đó, cụm giảm thiểu ảnh hưởng của một nhà lãnh đạo độc hại bằng cách xoay nút nào dẫn đầu.

- Mỗi trình xác thực chọn nhà lãnh đạo dự kiến bằng cách sử dụng cùng một thuật toán, được mô tả bên dưới. Khi trình xác nhận nhận được một mục nhập sổ cái mới đã ký, có thể 
chắc chắn rằng một mục nhập đã được tạo bởi người lãnh đạo dự kiến. Thứ tự của các vị trí mà mỗi nhà lãnh đạo được chỉ định một vị trí được gọi là lịch trình lãnh đạo(leader 
schedule).

## Leader Schedule Rotation
- Trình xác thực từ chối các khối không có chữ ký của người dẫn đầu vị trí. Danh sách danh tính của tất cả các nhà lãnh đạo vị trí được gọi là lịch trình nhà lãnh đạo. Lịch trình 
của nhà lãnh đạo được tính toán lại cục bộ và định kỳ. Nó chỉ định các nhà lãnh đạo vị trí trong một khoảng thời gian được gọi là kỷ nguyên. Lịch trình phải được tính toán trước 
các vị trí mà nó chỉ định, sao cho trạng thái sổ cái mà nó sử dụng để tính toán lịch trình được hoàn thành. Khoảng thời gian đó được gọi là thời gian bù lịch trình của người lãnh 
đạo. Solana đặt độ lệch thành khoảng thời gian của các vị trí cho đến kỷ nguyên tiếp theo. Nghĩa là, lịch trình của người lãnh đạo cho một kỷ nguyên được tính toán từ trạng thái 
sổ cái vào đầu kỷ nguyên trước đó. Sự bù đắp của một kỷ nguyên khá tùy ý và được giả định là đủ dài để tất cả các trình xác thực sẽ hoàn thành trạng thái sổ cái của họ trước khi 
lịch biểu tiếp theo được tạo. Một nhóm có thể chọn rút ngắn thời gian bù đắp để giảm thời gian giữa các thay đổi cổ phần và cập nhật lịch trình của người lãnh đạo.

- Trong khi hoạt động mà không có phân vùng kéo dài hơn một kỷ nguyên, lịch trình chỉ cần được tạo khi ngã ba gốc vượt qua ranh giới kỷ nguyên. Vì lịch trình là cho kỷ nguyên tiếp 
theo, bất kỳ cổ phần mới nào được cam kết với root fork sẽ không hoạt động cho đến kỷ nguyên tiếp theo. Khối được sử dụng để tạo lịch trình lãnh đạo là khối đầu tiên vượt qua ranh
giới kỷ nguyên.

- Nếu không có phân vùng kéo dài hơn một kỷ nguyên, cụm sẽ hoạt động như sau:
1. Trình xác nhận liên tục cập nhật root fork của chính nó khi nó bỏ phiếu.
2. Trình xác thực cập nhật lịch trình hàng đầu của nó mỗi khi chiều cao vị trí vượt qua ranh giới kỷ nguyên.

## Leader Schedule Generation Algorithm.

1. Định kỳ sử dụng chiều cao đánh dấu PoH ( một bộ đếm tăng đơn điệu ) để tạo ra một thuật toán giả ngẫu nhiên ổn định.
2. Ở độ cao đó, hãy lấy mẫu ngân hàng cho tất cả các tài khoản cổ phần có danh tính người lãnh đạo đã bỏ phiếu trong một số lượng tick được định cấu hình theo cụm. Mẫu được gọi 
là tập hoạt động.
3. Sắp xếp tập hợp hoạt động theo trọng lượng tiền cược.
4. Sử dụng hạt giống ngẫu nhiên để chọn các nút được tính theo tỷ trọng để tạo thứ tự có tỷ trọng theo tỷ trọng.
5. Thứ tự này trở nên hợp lệ sau một số lượng tích tắc được cấu hình theo cụm.



