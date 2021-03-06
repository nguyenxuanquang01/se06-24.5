# Gossip Service

Gossip Service hoạt động như một cổng vào các nút trong mặt phẳng điều khiển. Người xác nhận sử dụng dịch vụ để đảm bảo thông tin có sẵn cho tất cả các nút khác trong một cụm. Dịch vụ truyền phát thông tin bằng giao thức tin đồn.

## Gossip Overview

Các nút liên tục chia sẻ các đối tượng dữ liệu đã ký với nhau để quản lý một cụm. Ví dụ: họ chia sẻ thông tin liên hệ, chiều cao sổ cái và phiếu bầu.

Mỗi phần mười giây, mỗi nút sẽ gửi một thông điệp "đẩy" và / hoặc một thông báo "kéo". Thông báo đẩy và kéo có thể gợi ra phản hồi và thông báo đẩy có thể được chuyển tiếp đến những người khác trong cụm.

Gossip chạy trên một cổng UDP / IP nổi tiếng hoặc một cổng trong một phạm vi nổi tiếng. Khi một cụm được khởi động, các nút quảng cáo với nhau nơi tìm điểm cuối tin đồn của chúng (một địa chỉ ổ cắm).

## Gossip Record

Các bản ghi được chia sẻ qua tin đồn là tùy ý, nhưng được ký và tạo phiên bản (với dấu thời gian) khi cần thiết để có ý nghĩa đối với nút nhận chúng. Nếu một nút nhận được hai bản ghi từ cùng một nguồn, nó sẽ cập nhật bản sao của chính nó với bản ghi có dấu thời gian gần đây nhất.
## Gossip Service Interface

### Push Message

Một nút sẽ gửi một thông điệp đẩy để cho nhóm biết rằng nó có thông tin để chia sẻ. Nude gửi tin nhắn đẩy đến `PUSH FANOUT` push ngang hàng.
1. Duplicatin: Nếu thông báo đã được nhìn thấy trước đó, nút sẽ xóa thông báo và có thể trả lời bằng `PushMessagePrune` nếu được chuyển tiếp từ một nút có tỷ lệ thấp

2. New data: Nếu thông báo là mới cho nút
    - Lưu trữ thông tin mới với phiên bản cập nhật trong thông tin cụm của nó và xóa mọi giá trị cũ hơn trước đó
    - Lưu trữ tin nhắn trong `push_once` (được sử dụng để phát hiện các bản sao, được xóa sau `PUSH_MSG_TIMEOUT * 5` mili giây)
    - Truyền lại các thông điệp đến các đồng nghiệp đẩy của chính nó

3. Expiration: nodes drop push messages that are older than `PUSH_MSG_TIMEOUT`

### Push Peers, Prune Message

Một nút chọn các đồng nghiệp đẩy của nó một cách ngẫu nhiên từ tập hợp các đồng nghiệp đã biết đang hoạt động. Nút giữ lựa chọn này trong một thời gian tương đối dài. Khi nhận được thông báo sơ lược, nút này sẽ loại bỏ ứng dụng đẩy đã gửi sơ lược. Prune là một dấu hiệu cho thấy có một đường dẫn khác, có trọng số tiền cược cao hơn đến nút đó hơn là đẩy trực tiếp.

Tập hợp các đồng nghiệp đẩy được giữ mới bằng cách xoay một nút mới vào tập sau mỗi `PUSH_MSG_TIMEOUT / 2` mili giây.


### Pull Message

Một nút sẽ gửi một thông điệp kéo để hỏi cụm xem có bất kỳ thông tin mới nào không. Một thông điệp kéo được gửi ngẫu nhiên đến một người ngang hàng và bao gồm một bộ lọc Bloom đại diện cho những thứ mà nó đã có. Một nút nhận được thông báo kéo sẽ lặp lại các giá trị của nó và xây dựng phản hồi kéo của những thứ bỏ sót bộ lọc và sẽ phù hợp với một thông báo.

Một nút xây dựng bộ lọc Bloom kéo bằng cách lặp lại các giá trị hiện tại và các giá trị đã xóa gần đây.

Một nút xử lý các mục trong phản hồi kéo giống như cách nó xử lý dữ liệu mới trong thông báo đẩy.

## Purging

Các nút giữ lại các phiên bản trước của giá trị (những giá trị được cập nhật bằng cách kéo hoặc đẩy) và giá trị đã hết hạn (những giá trị cũ hơn `GOSSIP_PULL_CRDS_TIMEOUT_MS`) trong `purged_values` (những thứ tôi có gần đây).Thanh lọc các nút `purged_values` là các nút cũ hơn `5 * GOSSIP_PULL_CRDS_TIMEOUT_MS`.

## Eclipse Attacks

Một cuộc tấn công nhật thực là một nỗ lực để chiếm lấy tập hợp các kết nối nút với các điểm cuối đối nghịch.

Điều này có liên quan đến việc triển khai của chúng tôi theo những cách sau.
- Thông báo kéo chọn một nút ngẫu nhiên từ mạng. Một cuộc tấn công nhật thực khi kéo sẽ yêu cầu kẻ tấn công tác động đến lựa chọn ngẫu nhiên theo cách mà chỉ các nút đối nghịch được chọn để kéo.

- Thông điệp đẩy duy trì một tập hợp các nút đang hoạt động và chọn một fanout ngẫu nhiên cho mỗi thông báo đẩy. Một cuộc tấn công nhật thực khi đẩy sẽ ảnh hưởng đến lựa chọn tập hợp đang hoạt động, hoặc lựa chọn phân bố ngẫu nhiên.

### Time and Stake based weights

Trọng lượng được tính dựa trên `time since last picked` và `natural log` của `stake weight`.

Tính theo trọng số tiền cược cho phép mang lại cho tất cả các nút cơ hội phủ sóng mạng công bằng hơn trong một khoảng thời gian hợp lý. Nó giúp bình thường hóa sự khác biệt lớn về trọng lượng cổ phần có thể có giữa các nút. Bằng cách này, một nút có tỷ trọng tiền cược thấp, so với một nút có tỷ trọng tiền cược lớn sẽ chỉ phải đợi một vài bội số của ln (tiền cược) giây trước khi nó được chọn.

Không có cách nào để kẻ xấu tác động đến các thông số này.

### Pull Message

Một nút được chọn làm mục tiêu kéo dựa trên các trọng số được mô tả ở trên.

### Push Message

Một thông điệp sơ lược chỉ có thể loại bỏ kẻ thù khỏi một kết nối tiềm năng.

Cũng giống như pull message, các nút được chọn vào tập hợp hoạt động dựa trên trọng số.

## Notable differences from PlumTree

Giao thức đẩy hoạt động được mô tả ở đây dựa trên Cây mận. Sự khác biệt chính là:

- Thông báo đẩy có một đồng hồ treo tường được ký bởi người khởi tạo. Sau khi đồng hồ treo tường hết hạn, thông báo sẽ bị xóa. Giới hạn bước nhảy rất khó thực hiện trong bối cảnh đối đầu.

- Lazy Push không được triển khai vì nó không rõ ràng về cách ngăn kẻ thù giả mạo dấu vân tay tin nhắn. Một cách tiếp cận ngây thơ sẽ cho phép một đối thủ được ưu tiên kéo dựa trên đầu vào của họ.