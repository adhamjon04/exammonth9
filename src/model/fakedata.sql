insert into company(company_name)
values  ('Family house'),
        ('Xonsaroy'),
        ('Golden house'),
        ('Olmazor City');

insert into complex(complex_name,company_id)
values  ('Family house Yunusobod', '28a65a87-0eba-428a-9402-545cc8973dd1'),
        ('Family house Mirobod', '28a65a87-0eba-428a-9402-545cc8973dd1'),
        ('Xonsaroy Chilonzor', 'a24b7316-5527-446e-beae-2f987b0d3c27'),
        ('Xonsaroy Mirzo Ulug`bek', 'a24b7316-5527-446e-beae-2f987b0d3c27'),
        ('Golden House Sergeli', 'b1b43eba-6e3d-4d9c-80a4-aea99eb3ad68'),
        ('Golden House Yakkasaroy', 'b1b43eba-6e3d-4d9c-80a4-aea99eb3ad68'),
        ('Olmazor City Mirobod', '10e36c00-90e5-44ca-8069-afe178e443a7'),
        ('Olmazor City Chilonzor', '10e36c00-90e5-44ca-8069-afe178e443a7');

insert into room(room_count,room_square,room_price,complex_id)
values  (1,34.64, 15659900, 'faedf31f-90fd-4197-9d8c-48867644ab2f' ),
        (1,40.67, 18777900, '01c9ff2a-c942-47d6-8063-378d8a479a0b' ),
        (2,71.64, 19209800, 'faedf31f-90fd-4197-9d8c-48867644ab2f' ),
        (2,57.56, 16486100, '01c9ff2a-c942-47d6-8063-378d8a479a0b' ),
        (3,160.43,  29500000, 'faedf31f-90fd-4197-9d8c-48867644ab2f' ),
        (3,126.44, 22104600, '01c9ff2a-c942-47d6-8063-378d8a479a0b' ),
        (4,163.1,  26106000, 'faedf31f-90fd-4197-9d8c-48867644ab2f' ),
        (4,121.44, 25260000, '01c9ff2a-c942-47d6-8063-378d8a479a0b' ),
        (1,33.78, 15659900, '9eac930b-2772-4117-b41b-4c94d1c2402d' ),
        (1,40.67, 18777900, 'c92cc764-7725-4b42-8ef1-f0129e0da85d' ),
        (2,69.35, 19209800, '9eac930b-2772-4117-b41b-4c94d1c2402d' ),
        (2,57.37, 16486100, 'c92cc764-7725-4b42-8ef1-f0129e0da85d' ),
        (3,159.43,  29500000, '9eac930b-2772-4117-b41b-4c94d1c2402d' ),
        (3,126.68, 22104600, 'c92cc764-7725-4b42-8ef1-f0129e0da85d' ),
        (4,163.1,  26106000, '9eac930b-2772-4117-b41b-4c94d1c2402d' ),
        (4,160.26, 25260000, 'c92cc764-7725-4b42-8ef1-f0129e0da85d' ),
        (1,34.64, 15659900, '6feb15b8-4f0c-4ec9-98bc-22a16b4c7cc6' ),
        (1,40.67, 18777900, '5cdbb465-3f4f-4c79-8adc-982f35905051' ),
        (2,71.64, 19209800, '6feb15b8-4f0c-4ec9-98bc-22a16b4c7cc6' ),
        (2,57.56, 16486100, '5cdbb465-3f4f-4c79-8adc-982f35905051' ),
        (3,160.43,  29500000, '6feb15b8-4f0c-4ec9-98bc-22a16b4c7cc6' ),
        (3,126.44, 22104600, '5cdbb465-3f4f-4c79-8adc-982f35905051' ),
        (4,163.1,  26106000, '6feb15b8-4f0c-4ec9-98bc-22a16b4c7cc6' ),
        (4,121.44, 25260000, '5cdbb465-3f4f-4c79-8adc-982f35905051' ),
        (1,33.78, 15659900, '14ab0cba-5de4-4b83-9858-334829aa7e0f' ),
        (1,40.67, 18777900, '9a99c19b-9f15-4f40-bd3a-f1e04736b9ab' ),
        (2,69.35, 19209800, '14ab0cba-5de4-4b83-9858-334829aa7e0f' ),
        (2,57.37, 16486100, '9a99c19b-9f15-4f40-bd3a-f1e04736b9ab' ),
        (3,159.43,  29500000, '14ab0cba-5de4-4b83-9858-334829aa7e0f' ),
        (3,126.68, 22104600, '9a99c19b-9f15-4f40-bd3a-f1e04736b9ab' ),
        (4,163.1,  26106000, '14ab0cba-5de4-4b83-9858-334829aa7e0f' ),
        (4,160.26, 25260000, '9a99c19b-9f15-4f40-bd3a-f1e04736b9ab' );


insert into banks(bank_name, bank_max_sum, bank_services)
values  ('Xalq banki', 4500000000, 20),
        ('Agro bank', 5000000000, 24),
        ('Aloqa bank', 3000000000, 18),
        ('Davr Bank', 2500000000, 17);