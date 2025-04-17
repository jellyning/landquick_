import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LANDQUICK',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Sarabun',
      ),
      home: const MainLayout(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    BorrowerPage(),
    InvestorPage(),  // แก้ไขให้เป็น InvestorPage
    PlaceholderPage(),
    FAQPage(),
    AboutPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavBar(onItemSelected: _onItemTapped, selectedIndex: _selectedIndex),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: _pages[_selectedIndex],
        ),
      ),
    );
  }
}

class TopNavBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(int) onItemSelected;
  final int selectedIndex;

  const TopNavBar({
    super.key,
    required this.onItemSelected,
    required this.selectedIndex,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 60);

  @override
  Widget build(BuildContext context) {
    final items = ['หน้าหลัก', 'ผู้กู้ยืม', 'ผู้ลงทุน', 'รับขายฝาก', 'คำถามที่พบบ่อย', 'เกี่ยวกับเรา'];

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 2,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'LANDQUICK PROPERTY',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const Text(
                'โฉนดแลกเงิน',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
              const SizedBox(height: 10),
              Container(
                color: Colors.blue.shade100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(items.length, (index) {
                    return TextButton(
                      onPressed: () => onItemSelected(index),
                      child: Text(
                        items[index],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                          color: selectedIndex == index ? Colors.blue[900] : Colors.black,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(40),
            color: Colors.blue.shade50,
            width: double.infinity,
            child: Column(
              children: const [
                Text(
                  'ที่ดินมีค่า เปลี่ยนเป็นเงินได้ง่ายๆ',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  'ขายฝากได้เงินไว ดอกเบี้ยต่ำ ปลอดภัย',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          const ServiceBox(
            title: 'ถูกต้องตามกฎหมาย',
            description: 'ดำเนินสัญญาขายฝากถูกต้องตามกฎหมาย ณ สำนักงานที่ดิน',
            icon: Icons.gavel,
          ),
          const SizedBox(height: 20),
          const ServiceBox(
            title: 'ไม่เช็คประวัติทางการเงิน​',
            description: 'ไม่เช็คเครดิตบูโร ไม่ต้องใช้สลิปหรือเช็คประวัติการเงิน และไม่จำเป็นต้องใช้คนค้ำประกัน',
            icon: Icons.no_accounts,
          ),
          const SizedBox(height: 20),
          const ServiceBox(
            title: 'ขายฝาก ดอกเบี้ยต่ำ',
            description: 'ขายฝาก ดอกเบี้ยต่ำเพียง 9 – 15% ต่อปี ช่วยคุณประหยัดได้มากขึ้น เพื่อให้ผู้ขายฝากมีโอกาสในการปิดหนี้ได้',
            icon: Icons.percent,
          ),
          const SizedBox(height: 20),
          const ServiceBox(
            title: 'ปรึกษาฟรี',
            description: 'ให้คำปรึกษาด้านการเงินฟรี ไม่มีค่าใช้จ่าย',
            icon: Icons.support_agent,
          ),
        ],
      ),
    );
  }
}

class BorrowerPage extends StatelessWidget {
  const BorrowerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(40),
            color: Colors.blue.shade50,
            width: double.infinity,
            child: Column(
              children: const [
                Text(
                  'ฝากขายง่าย ได้เงินจริง',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  'อนุมัติไว สำหรับคนไทย ถูกกฎหมายและปลอดภัย',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          const ServiceBox(
            title: 'อนุมัติไว',
            description: 'ยื่นเรื่องง่าย รู้ผลไวใน 1-3 วัน ไม่ต้องรอนาน',
            icon: Icons.speed,
          ),
          const SizedBox(height: 20),
          const ServiceBox(
            title: 'สำหรับคนไทย',
            description: 'บริการสำหรับเจ้าของโฉนดที่ดินในประเทศไทยทุกภูมิภาค',
            icon: Icons.flag,
          ),
          const SizedBox(height: 20),
          const ServiceBox(
            title: 'ถูกกฎหมายและปลอดภัย',
            description: 'ดำเนินการภายใต้กรอบกฎหมาย ณ สำนักงานที่ดิน โปร่งใสและมั่นใจได้',
            icon: Icons.verified_user,
          ),
          const SizedBox(height: 20),
          const ServiceBox(
            title: 'ขายฝาก ดอกเบี้ยต่ำ',
            description: 'ขายฝาก ดอกเบี้ยต่ำเพียง 9 – 15% ต่อปี ช่วยลดภาระดอกเบี้ยให้ผู้กู้',
            icon: Icons.percent,
          ),
          const SizedBox(height: 20),
          const ServiceBox(
            title: 'ปรึกษาฟรี',
            description: 'ติดต่อเราวันนี้เพื่อขอคำแนะนำฟรี ไม่มีค่าใช้จ่าย',
            icon: Icons.support_agent,
          ),
        ],
      ),
    );
  }
}

class InvestorPage extends StatelessWidget {
  const InvestorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(40),
            color: Colors.blue.shade50,
            width: double.infinity,
            child: Column(
              children: const [
                Text(
                  'ลงทุนกับ LANDQUICK',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  'ผลตอบแทนสูง การันตีผลตอบแทนตามสัญญา ปลอดภัยและมั่นคง',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          const ServiceBox(
            title: 'ผลตอบแทนสูงกว่า',
            description: 'ผลตอบแทนสูงกว่าเงินฝากทั่วไป และสัญญาผลตอบแทนที่มั่นคง',
            icon: Icons.trending_up,
          ),
          const SizedBox(height: 20),
          const ServiceBox(
            title: 'การันตีรับผลตอบแทนตามสัญญา',
            description: 'การันตีผลตอบแทนตามเงื่อนไขสัญญาอย่างโปร่งใส',
            icon: Icons.security,
          ),
          const SizedBox(height: 20),
          const ServiceBox(
            title: 'จำกัดวงเงินที่ 40% - 60%',
            description: 'จำกัดวงเงินในการปล่อยสินเชื่อในช่วง 40% - 60% ของราคาประเมิน',
            icon: Icons.attach_money,
          ),
          const SizedBox(height: 20),
          const ServiceBox(
            title: 'จำกัดวงเงินการปล่อยสินเชื่อไม่เกินราคาประเมินอสังหาริมทรัพย์',
            description: 'วงเงินสินเชื่อไม่เกินราคาประเมินอสังหาริมทรัพย์ เพื่อความปลอดภัย',
            icon: Icons.home,
          ),
        ],
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'เกี่ยวกับเรา',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'LANDQUICK เป็นบริการที่ช่วยให้เจ้าของที่ดินสามารถแปลงสินทรัพย์เป็นเงินสดได้อย่างรวดเร็วและปลอดภัย เรามุ่งมั่นในการให้บริการทางการเงินที่โปร่งใสและยุติธรรม โดยมีเงื่อนไขที่เหมาะสมกับลูกค้าในแต่ละราย',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class PlaceholderPage extends StatelessWidget {
  const PlaceholderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(40),
            color: Colors.blue.shade50,
            width: double.infinity,
            child: Column(
              children: const [
                Text(
                  'ขายฝาก LANDQUICK',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  'ได้รับเงินก้อน ผลตอบแทนสูง',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          const ServiceBox(
            title: 'ขายฝากคืออะไร?',
            description:
                'ขายฝาก (Sale with Right of Redemption) คือ การขายทรัพย์สินให้แก่ผู้รับซื้อฝาก โดยมีเงื่อนไขให้ผู้ขายสามารถไถ่คืนทรัพย์สินภายในระยะเวลาที่กำหนด',
            icon: Icons.help_outline,
          ),
          const SizedBox(height: 20),
          const ServiceBox(
            title: 'ข้อดีของการขายฝาก',
            description:
                'ผู้ขายฝาก (เจ้าของทรัพย์) ได้รับเงินก้อนจากผู้รับซื้อฝาก โดยมีสิทธิ์ไถ่คืนภายในระยะเวลาที่ตกลงกัน',
            icon: Icons.thumb_up_alt_outlined,
          ),
          const SizedBox(height: 20),
          const ServiceBox(
            title: 'จุดสำคัญ',
            description:
                'หากผู้ขายฝากไม่สามารถไถ่คืนทรัพย์สินภายในเวลาที่กำหนด กรรมสิทธิ์จะตกเป็นของผู้รับซื้อฝากโดยสมบูรณ์',
            icon: Icons.warning_amber_outlined,
          ),
        ],
      ),
    );
  }
}
class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'คำถามที่พบบ่อย',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),

          FAQItem(
            question: 'บริการของเราถูกกฎหมายหรือไม่ ?',
            answer:
                'บริการของ Land for Loan มีลักษณะเดียวกับนายหน้า ที่มีหน้าที่ชี้ช่องและประสานให้คู่สัญญาทั้งสองฝ่ายได้ทำสัญญากัน โดยการหานักลงทุนและผู้ต้องการกู้ยืมจะใช้ระบบออนไลน์ และ Land for Loan จะไม่รับโอนหรือเป็นตัวกลางในการโอนเงินกู้ โดยผู้ลงทุนจะส่งมอบแคชเชียร์เช็คให้ผู้กู้ในวันทำสัญญาที่กรมที่ดินโดยตรง',
          ),

          FAQItem(
            question: 'การลงทุนรับขายฝากและรับจำนองมีความเสี่ยงแตกต่างกันอย่างไร?',
            answer:
                '1. ความแตกต่างในการโอนกรรมสิทธิ์: ขายฝากคือการโอนกรรมสิทธิ์ให้ผู้ลงทุนทันที และผู้กู้จะได้รับคืนเมื่อชำระเงินไถ่ ส่วนจำนองกรรมสิทธิ์ยังเป็นของผู้กู้\n\n'
                '2. การบังคับให้ชำระหนี้: ขายฝากหากไม่คืนเงินในกำหนด ทรัพย์จะหลุดทันที โดยไม่สามารถฟ้องให้คืนเงินได้ ส่วนจำนองต้องฟ้องศาลเพื่อบังคับชำระ\n\n'
                '3. วงเงิน: ขายฝากให้วงเงินมากกว่า เนื่องจากความมั่นใจในการถือครองกรรมสิทธิ์ ต่างจากจำนองที่มีความเสี่ยงทางกฎหมายสูงกว่า',
          ),

          FAQItem(
            question: 'ราคาประเมินทรัพย์ที่แสดงมาจากไหน เชื่อถือได้มากน้อยเพียงใด?',
            answer:
                'ราคาประเมินมาจากบริษัทประเมินที่ได้รับการรับรองจากสำนักงาน กลต. โดยใช้ 3 วิธีหลัก:\n\n'
                '1. วิเคราะห์จากต้นทุน (Cost Approach): ใช้ต้นทุนก่อสร้างใหม่ หักค่าเสื่อม เพิ่มมูลค่าที่ดิน\n'
                '2. เปรียบเทียบตลาด (Market Comparable Approach): เทียบราคาทรัพย์ในทำเลและสภาพคล้ายกัน\n'
                '3. แปลงรายได้เป็นมูลค่า (Income Approach): ประเมินจากกระแสรายได้ในอนาคตที่สามารถสร้างได้จากทรัพย์สินนั้น\n\n'
                'ทั้ง 3 วิธีช่วยเพิ่มความน่าเชื่อถือในการกำหนดราคาประเมินที่ใช้ในธุรกรรม',
          ),
        ],
      ),
    );
  }
}

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  const FAQItem({
    super.key,
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue[900],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            answer,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
class ServiceBox extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const ServiceBox({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blue.shade100),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(2, 2),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 40, color: Colors.blue[900]),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900])),
                const SizedBox(height: 8),
                Text(description, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
