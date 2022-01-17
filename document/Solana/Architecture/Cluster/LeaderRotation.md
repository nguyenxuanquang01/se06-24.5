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

## Schedule Attack Vectors

### Seed

### Active Set

Một người dẫn đầu có thể thiên vị nhóm hoạt động bằng cách kiểm duyệt phiếu bầu của người xác nhận. Có hai cách khả thi để các người dẫn đầu kiểm duyệt nhóm hoạt động:
- Phớt lờ phiếu bầu từ trình xác thực.
- Từ chối bỏ phiếu cho các khối có phiếu bầu từ trình xác thực.

Để giảm khả năng bị kiểm duyệt, tập hợp hoạt động được tính toán ở ranh giới bù đắp lịch trình lãnh đạo trong một khoảng thời gian lấy mẫu tập hợp hoạt động. Khoảng thời gian lấy mẫu tập hợp hoạt động đủ dài để các phiếu bầu sẽ được thu thập bởi nhiều nhà lãnh đạo.

### Staking 
Những người đứng đầu có thể kiểm duyệt các giao dịch đặt cược mới hoặc từ chối xác thực các khối với số tiền đặt cược mới. Cuộc tấn công này tương tự như việc kiểm duyệt phiếu bầu của người xác nhận.

### Validator operational key loss

Những người đứng đầu và người xác nhận phải sử dụng các khóa tạm thời để hoạt động và chủ sở hữu cổ phần ủy quyền cho người xác nhận thực hiện công việc với cổ phần của họ thông qua ủy quyền.

Cụm sẽ có thể khôi phục sau khi mất tất cả các khóa tạm thời được sử dụng bởi những người đứng đầu và trình xác nhận, điều này có thể xảy ra thông qua một lỗ hổng phần mềm chung được chia sẻ bởi tất cả các nút. Chủ sở hữu cổ phần sẽ có thể bỏ phiếu trực tiếp bằng cách đồng ký vào một phiếu bầu của người xác nhận mặc dù cổ phần hiện được ủy quyền cho người xác nhận.

## Appending Entries

Thời gian tồn tại của lịch trình lãnh đạo được gọi là kỷ nguyên. Kỷ nguyên được chia thành các khe, trong đó mỗi khe có khoảng thời gian T PoH tích tắc.

Một nhà lãnh đạo truyền các mục nhập trong thời gian của nó. Sau khi T đánh dấu, tất cả người xác nhận chuyển sang người lãnh đạo đã lên lịch tiếp theo. Người xác thực phải bỏ qua các mục nhập được gửi bên ngoài vị trí được chỉ định của người lãnh đạo.

Tất cả các tick T phải được quan sát bởi người lãnh đạo tiếp theo để nó xây dựng các mục của riêng mình. Nếu các mục nhập không được quan sát (người lãnh đạo bị thất bại) hoặc các mục nhập không hợp lệ (người lãnh đạo bị lỗi hoặc độc hại), người lãnh đạo tiếp theo phải tạo ra các dấu tích để lấp đầy vị trí của người lãnh đạo trước đó. Lưu ý rằng người lãnh đạo tiếp theo nên thực hiện các yêu cầu sửa chữa song song và hoãn việc gửi tick cho đến khi chắc chắn rằng những người xác nhận khác cũng không theo dõi được các mục nhập của người lãnh đạo trước đó. Nếu một nhà lãnh đạo xây dựng sai trên các tick của riêng mình, người lãnh đạo theo sau nó phải thay thế tất cả các tick của nó.