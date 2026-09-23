import 'package:flutter/material.dart';

class SaveSmartApp extends StatelessWidget {
  const SaveSmartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SaveSmart',

      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF7F8FA),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF006B5F)),
        fontFamily: 'Roboto',
      ),

      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F8FA),
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good morning',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 2),
            Text(
              'Welcome to SaveSmart',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ------------------------------------------
            // TOTAL SAVINGS
            // ------------------------------------------

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF006B5F),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total savings',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),

                  SizedBox(height: 8),

                  Text(
                    '₹1,25,000',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    'Across your goals and deposits',
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // ------------------------------------------
            // GOALS
            // ------------------------------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Your goals',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                TextButton(onPressed: () {}, child: const Text('View all')),
              ],
            ),

            const SizedBox(height: 8),

            _GoalCard(
              icon: Icons.directions_bike,
              title: 'New Bike',
              savedAmount: '₹45,000',
              targetAmount: '₹80,000',
              progress: 0.56,
            ),

            const SizedBox(height: 12),

            _GoalCard(
              icon: Icons.flight_takeoff,
              title: 'Goa Trip',
              savedAmount: '₹18,000',
              targetAmount: '₹30,000',
              progress: 0.60,
            ),

            const SizedBox(height: 28),

            // ------------------------------------------
            // DEPOSITS
            // ------------------------------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Your deposits',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                TextButton(onPressed: () {}, child: const Text('View all')),
              ],
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                Expanded(
                  child: _DepositCard(
                    title: 'Fixed Deposit',
                    amount: '₹50,000',
                    icon: Icons.account_balance,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _DepositCard(
                    title: 'Recurring Deposit',
                    amount: '₹5,000/mo',
                    icon: Icons.autorenew,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            // ------------------------------------------
            // QUICK ACTIONS
            // ------------------------------------------
            const Text(
              'Quick actions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: _QuickAction(
                    icon: Icons.add_circle_outline,
                    title: 'New goal',
                    onTap: () {},
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _QuickAction(
                    icon: Icons.calculate_outlined,
                    title: 'FD calculator',
                    onTap: () {},
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: _QuickAction(
                    icon: Icons.lock_outline,
                    title: 'Book FD',
                    onTap: () {},
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _QuickAction(
                    icon: Icons.repeat,
                    title: 'Book RD',
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      // ------------------------------------------
      // BOTTOM NAVIGATION
      // ------------------------------------------
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        onDestinationSelected: (index) {},
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.flag_outlined),
            selectedIcon: Icon(Icons.flag),
            label: 'Goals',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_balance_outlined),
            selectedIcon: Icon(Icons.account_balance),
            label: 'Deposits',
          ),
        ],
      ),
    );
  }
}

// ======================================================
// GOAL CARD
// ======================================================

class _GoalCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String savedAmount;
  final String targetAmount;
  final double progress;

  const _GoalCard({
    required this.icon,
    required this.title,
    required this.savedAmount,
    required this.targetAmount,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFE4F3F0),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: const Color(0xFF006B5F)),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      '$savedAmount of $targetAmount',
                      style: const TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ],
                ),
              ),

              Text(
                '${(progress * 100).round()}%',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF006B5F),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: Colors.grey.shade200,
              valueColor: const AlwaysStoppedAnimation(Color(0xFF006B5F)),
            ),
          ),
        ],
      ),
    );
  }
}

// ======================================================
// DEPOSIT CARD
// ======================================================

class _DepositCard extends StatelessWidget {
  final String title;
  final String amount;
  final IconData icon;

  const _DepositCard({
    required this.title,
    required this.amount,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF006B5F)),

          const SizedBox(height: 16),

          Text(title, style: const TextStyle(fontSize: 13, color: Colors.grey)),

          const SizedBox(height: 4),

          Text(
            amount,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

// ======================================================
// QUICK ACTION
// ======================================================

class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _QuickAction({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF006B5F)),

            const SizedBox(width: 10),

            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
