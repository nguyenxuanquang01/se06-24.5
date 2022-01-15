Trước khi chúng ta bắt đầu tìm hiểu Stake trên Solana thì chúng ta sẽ tìm hiểu Staking trước.
# Staking là gì?
Staking đươc hiểu đơn giản là việc khóa các đồng tiền mã hóa để nhận các phần thưởng bằng cách đặt mã thông báo SOL của mình. Vì đã giúp bảo mật mạng.

Trong nhiều trường hợp chúng ta có thể tích lũy đồng coin của mình trực tiếp từ ví điện tử. Hiều đơn giản thì Staking chính là để khóa các đồng tiền mã hóa. Để tìm hiểu rõ hơn ta cần tìm hiểu về cơ chế PoS(Proof of Stake) là gì.

PoS là cơ chế đồng thuận của Blockchain cho phép các node phải stake coin hoạt động trên Block hay nói cách khác là phải đặt cọc coin để được giao quyền ngẫu nhiên cho chúng ta để xã thực các khối tiệp theo. Xác suất được chọn thông thường tỷ lệ thuận với số lượng coin vì càng nhiều coin bị khóa sẽ có cơ hội được chọn càng cao. Với những người có ít coin họ có thể stake coin của mình thông qua ủy quyển coin cho những người xác thực. Từ đó sẽ nhận lại phần trăm phần thưởng từ những người xác thực đó tùy thuộc vào số lượng coin ủy quyền và thời gian uy quyền

Người xác thực được ủy quyền là người xử lý các hoạt động chính và quản lý tổng thể mạng Blockchain. Họ tham gia vào mọi quá trình để có được sự đồng thuận và xác định của các tham số quản trị quan trọng. Người xác thực phải chịu chi phí bằng cách chạy và bảo trì hệ thống của họ và điều này được chuyển cho người ủy quyền dưới hình thức phí thu được như một tỷ lệ phần thưởng kiếm được. Phí này được gọi là hoa hồng. Vì những người xác thực kiếm được nhiều phần thưởng hơn thì số tiền đặt cược được giao cho họ càng nhiều, họ có thể cạnh tranh với nhau đưa ra mức hoa hồng thấp nhất cho các dịch vụ của họ.

Thì trên Soalna cũng như vậy. càng nhiều coin được ủy quyền cho người xác thực, thì người xác nhận này ngày càng được chọn thường xuyên hơn để ghi các giao dịch mới vào sổ cái. Người xác thực càng viết nhiều giao dịch, thì người xác thực và người ủy quyền của nó càng kiếm được nhiều phần thưởng.

# Làm cách nào để đặt cược mã thông báo SOL của tôi?
Bạn có thể đặt cược SOL bằng cách chuyển các mã thông báo của mình vào một ví có hỗ trợ đặt cược. Ví cung cấp các bước để tạo tài khoản cổ phần và thực hiện ủy quyền.

## Tạo một tài khoản cổ phần
Làm theo hướng dẫn của ví để tạo tài khoản đặt cược. Tài khoản này sẽ thuộc loại khác với loại được sử dụng để gửi và nhận mã thông báo đơn giản.

## Chọn một Trình xác thực
Làm theo hướng dẫn của ví để chọn trình xác thực. Bạn có thể nhận thông tin về các trình xác thực hoạt động tiềm năng từ các liên kết bên dưới. Solana Foundation không đề xuất bất kỳ trình xác thực cụ thể nào.

Người xác thực Mainnet Beta giới thiệu bản thân và các dịch vụ của họ trên chuỗi Diễn đàn Solana này:
- https://forums.solana.com/t/validator-information-thread.

Trang web solanabeach.io được xây dựng và duy trì bởi một trong những người xác nhận của chúng tôi, Cơ sở đánh dấu. Nó cung cấp một số thông tin đồ họa cấp cao về toàn bộ mạng, cũng như danh sách của từng trình xác thực và một số thống kê hiệu suất gần đây về từng trình xác thực.

- https://solanabeach.io/

Để xem thống kê sản xuất khối, hãy sử dụng các công cụ dòng lệnh Solana:

- `solana validators`
- `solana block-production`

Nhóm Solana không đưa ra khuyến nghị về cách giải thích thông tin này. Làm thẩm định của riêng bạn.

## Ủy quyền cổ phần của bạn

Làm theo hướng dẫn của ví để ủy quyền của bạn cho trình xác thực bạn đã chọn.

### Stake-o-matic hay còn gọi là Bots tự động ủy quyền

Chương trình off-chain này quản lý một lượng lớn các trình xác thực do một cơ quan trung ương đặt cọc. Solana Foundation sử dụng một bot tự động ủy quyền để thường xuyên ủy thác cổ phần của mình cho những người xác thực "không quá hạn" đáp ứng các yêu cầu về hiệu suất được chỉ định. Thông tin thêm có thể được tìm thấy [trên thông báo chính thức](https://forums.solana.com/t/stake-o-matic-delegation-matching-program/790).

### Stake Pools

Chương trình trực tuyến này gộp SOL lại với nhau do người quản lý đặt cược, cho phép người sở hữu SOL đặt cược và kiếm phần thưởng mà không cần quản lý tiền đặt cọc. Người dùng gửi SOL để đổi lấy mã thông báo SPL (đặt cược phái sinh) đại diện cho quyền sở hữu của họ trong nhóm cổ phần. Người quản lý hồ bơi đặt cọc SOL theo chiến lược của họ, có thể sử dụng một biến thể của bot tự động ủy quyền như được mô tả ở trên. Khi tiền đặt cược kiếm được phần thưởng, nhóm và mã thông báo nhóm tăng tương ứng về giá trị. Cuối cùng, chủ sở hữu mã thông báo chung có thể gửi mã thông báo SPL trở lại nhóm cổ phần để đổi SOL, do đó tham gia phân quyền với ít công việc hơn nhiều. Thông tin thêm có thể được tìm thấy tại [tài liệu về nhóm cổ phần SPL](https://spl.solana.com/stake-pool).

# Chi tiết tài khoản đặt cọc

Để biết thêm thông tin về các hoạt động và quyền được liên kết với tài khoản cổ phần, vui lòng xem [Tài khoản cổ phần](https://github.com/nguyenxuanquang01/se06-24.5/blob/master/document/Solana/Staking/Stake_accounts.md).
