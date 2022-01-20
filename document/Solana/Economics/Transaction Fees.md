# Transaction Fees

### Subject to change

Mỗi giao dịch được gửi qua mạng, được xử lý bởi khách hàng xác thực lãnh đạo hiện tại và được xác nhận là giao dịch trạng thái toàn cầu, đều có phí giao dịch. Phí giao dịch mang lại nhiều lợi ích trong thiết kế kinh tế Solana, ví dụ:
- cung cấp đơn vị bồi thường cho mạng trình xác thực đối với các tài nguyên CPU / GPU cần thiết để xử lý giao dịch trạng thái,

- giảm spam mạng bằng cách giới thiệu chi phí thực cho các giao dịch,

- và cung cấp sự ổn định kinh tế lâu dài tiềm năng của mạng thông qua số tiền phí tối thiểu do giao thức thu được trên mỗi giao dịch, như được mô tả bên dưới.

Các phiếu đồng thuận của mạng được gửi như chuyển giao hệ thống thông thường, có nghĩa là người xác nhận phải trả phí giao dịch để tham gia vào sự đồng thuận.

Nhiều nền kinh tế blockchain hiện tại (ví dụ như Bitcoin, Ethereum), dựa vào phần thưởng dựa trên giao thức để hỗ trợ nền kinh tế trong ngắn hạn, với giả định rằng doanh thu được tạo ra thông qua phí giao dịch sẽ hỗ trợ nền kinh tế trong dài hạn, khi giao thức có được phần thưởng hết hiệu lực. Trong nỗ lực tạo ra một nền kinh tế bền vững thông qua phần thưởng dựa trên giao thức và phí giao dịch, một phần cố định (ban đầu là 50%) của mỗi khoản phí giao dịch sẽ bị hủy, với phần phí còn lại sẽ được chuyển cho nhà lãnh đạo hiện tại xử lý giao dịch. Tỷ lệ lạm phát toàn cầu theo lịch trình cung cấp nguồn cho phần thưởng được phân phối cho khách hàng xác thực, thông qua quy trình được mô tả ở trên.

Phí giao dịch được đặt bởi cụm mạng dựa trên thông lượng lịch sử gần đây, xem Phí thúc đẩy tắc nghẽn. Phần tối thiểu này của mỗi khoản phí giao dịch có thể được điều chỉnh động tùy thuộc vào các chữ ký lịch sử trên mỗi vị trí. Bằng cách này, giao thức có thể sử dụng mức phí tối thiểu để nhắm mục tiêu sử dụng phần cứng mong muốn. Bằng cách giám sát một giao thức được chỉ định chữ ký trên mỗi vị trí liên quan đến số tiền sử dụng mục tiêu, mong muốn, mức phí tối thiểu có thể được tăng / giảm, do đó sẽ giảm / tăng chữ ký thực tế trên mỗi vị trí trên mỗi khối cho đến khi nó đạt đến số tiền mục tiêu. Quá trình điều chỉnh này có thể được coi là tương tự như thuật toán điều chỉnh độ khó trong giao thức Bitcoin, tuy nhiên trong trường hợp này, nó đang điều chỉnh phí giao dịch tối thiểu để hướng dẫn việc sử dụng phần cứng xử lý giao dịch đến mức mong muốn.

Như đã đề cập, một tỷ lệ cố định của mỗi khoản phí giao dịch sẽ bị hủy bỏ. Mục đích của thiết kế này là duy trì động lực của nhà lãnh đạo để bao gồm nhiều giao dịch nhất có thể trong khoảng thời gian dành cho nhà lãnh đạo, đồng thời cung cấp cơ chế hạn chế lạm phát giúp bảo vệ chống lại các cuộc tấn công "trốn thuế" (tức là thanh toán phí kênh phụ).

Ngoài ra, các khoản phí bị cháy có thể được cân nhắc khi lựa chọn fork. Trong trường hợp fork PoH với một kẻ đứng đầu kiểm duyệt, độc hại, chúng tôi hy vọng tổng số phí bị phá hủy sẽ ít hơn một đợt fork trung thực có thể so sánh được, do phí bị mất từ việc kiểm duyệt. Nếu nhà lãnh đạo kiểm duyệt phải bồi thường cho các khoản phí giao thức bị mất này, họ sẽ phải tự thay thế các khoản phí bị cháy trên fork của họ, do đó có khả năng làm giảm động cơ kiểm duyệt ngay từ đầu.