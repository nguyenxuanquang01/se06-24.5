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