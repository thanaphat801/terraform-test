resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "trainee vpc"
  }
}



resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "route table for public subnet"
  }
}

resource "aws_route_table_association" "public_a_subnet_association" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public_route_table.id
}
resource "aws_route_table_association" "public_b_subnet_association" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.public_route_table.id
}
resource "aws_route_table_association" "public_c_subnet_association" {
  subnet_id      = aws_subnet.public_c.id
  route_table_id = aws_route_table.public_route_table.id
}



resource "aws_subnet" "public_a" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-southeast-1a"
  tags = {
    Name = "public a"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-southeast-1b"
  tags = {
    Name = "public b"
  }
}

resource "aws_subnet" "public_c" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "ap-southeast-1c"
  tags = {
    Name = "public c"
  }
}

resource "aws_subnet" "private_a" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-southeast-1a"
  tags = {
    Name = "private a"
  }
}

resource "aws_subnet" "private_b" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "ap-southeast-1b"
  tags = {
    Name = "private b"
  }
}

resource "aws_subnet" "private_c" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.6.0/24"
  availability_zone = "ap-southeast-1c"
  tags = {
    Name = "private c"
  }
}







resource "aws_route_table" "private_route_table_1" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.my_nat_gateway.id
  }
}

resource "aws_route_table" "private_route_table_2" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.my_nat_gateway.id
  }
}

resource "aws_route_table" "private_route_table_3" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.my_nat_gateway.id
  }
}

resource "aws_nat_gateway" "my_nat_gateway" {
  allocation_id = aws_eip.my_eip.id
  subnet_id     = aws_subnet.public_a.id
}

resource "aws_eip" "my_eip" {
  vpc = true
}

resource "aws_route_table_association" "private_route_table_association_1" {
  subnet_id      = aws_subnet.private_a.id
  route_table_id = aws_route_table.private_route_table_1.id
}

resource "aws_route_table_association" "private_route_table_association_2" {
  subnet_id      = aws_subnet.private_b.id
  route_table_id = aws_route_table.private_route_table_2.id
}

resource "aws_route_table_association" "private_route_table_association_3" {
  subnet_id      = aws_subnet.private_c.id
  route_table_id = aws_route_table.private_route_table_3.id
}