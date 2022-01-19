### Secure Vote Signing
- Người xác nhận sẽ nhận các bài dự thi từ người lãnh đạo hiện tại và gửi phiếu xác nhận các bài dự thi đó là hợp lệ. Việc gửi phiếu bầu này đưa ra một thách thức về bảo mật, vì 
các phiếu bầu giả mạo vi phạm các quy tắc đồng thuận có thể được sử dụng để cắt cổ phần của người xác nhận.
- Người xác thực bỏ phiếu cho fork đã chọn của nó bằng cách gửi một giao dịch sử dụng khóa không đối xứng để ký kết quả của công việc xác thực của nó. Các thực thể khác có thể 
xác minh chữ ký này bằng cách sử dụng khóa công khai của trình xác thực. Nếu khóa của trình xác thực được sử dụng để ký dữ liệu không chính xác ( ví dụ: phiếu bầu trên nhiều nhánh
của sổ cái ), cổ phần của nút hoặc tài nguyên của nó có thể bị xâm phạm.

## Validators, Vote Signers, and Stakeholders.
- Khi trình xác thực nhận được nhiều khối cho cùng một vị trí, nó sẽ theo dõi tất cả các nhánh có thể có cho đến khi xác định được cái "tốt nhất". Người xác thực chọn fork tốt 
nhất bằng cách gửi phiếu bầu cho nó, sử dụng người ký phiếu để giảm thiểu khả năng phiếu bầu của họ vô tình vi phạm quy tắc đồng thuận và bị cắt cổ phần.
- Người ký phiếu đánh giá phiếu bầu do người xác nhận đề xuất và chỉ ký vào phiếu bầu nếu nó không vi phạm điều kiện chặt chém. Người ký phiếu chỉ cần duy trì trạng thái tối thiểu
liên quan đến các phiếu mà họ đã ký và các phiếu được ký bởi phần còn lại của cụm. Nó không cần phải xử lý một tập hợp đầy đủ các giao dịch.

## Signing service
- Dịch vụ ký phiếu bầu bao gồm một máy chủ JSON RPC và một bộ xử lý yêu cầu. Khi khởi động, dịch vụ khởi động máy chủ RPC tại một cổng đã định cấu hình và đợi các yêu cầu trình xác 
thực. Nó mong đợi các loại yêu cầu sau:
1. Đăng ký một nút trình xác thực mới
2. Ký một phiếu bầu

## Validator voting
- Một nút xác thực, khi khởi động, tạo một tài khoản phiếu bầu mới và đăng ký nó với cụm bằng cách gửi một giao dịch "đăng ký phiếu bầu" mới. Các nút khác trên cụm xử lý giao dịch 
này và bao gồm trình xác thực mới trong tập hợp đang hoạt động. Sau đó, trình xác thực gửi giao dịch "bỏ phiếu mới" được ký bằng khóa riêng bỏ phiếu của trình xác thực trên mỗi sự 
kiện biểu quyết.
1. Configuration
2. Registration
3. Vote Collection
