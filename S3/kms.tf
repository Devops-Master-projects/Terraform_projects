#rename "mykey" --> aws_kms_key
/*resource "aws_kms_key" "mykey" {
    deletion_window_in_days = 15
}
*/

resource "aws_kms_key" "aws_kms_key" {
    deletion_window_in_days = 15
}