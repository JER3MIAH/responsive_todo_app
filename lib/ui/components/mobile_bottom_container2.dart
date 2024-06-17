import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_todo_app/models/selected.dart';
import 'package:responsive_todo_app/providers/selected_string_provider.dart';
import 'package:responsive_todo_app/ui/theme/colors.dart';

class MobileBottomContainer2 extends ConsumerWidget {
  final bool isMobile;
  const MobileBottomContainer2({
    super.key,
    required this.isMobile,
  });
  @override
  Widget build(BuildContext context, ref) {
    final List<String> textTitles = ['All', 'Active', 'Completed'];
    final selectedString = ref.watch(selectedStringProvider);

    String selected() {
      if (selectedString == IsSelected.all) {
        return 'All';
      } else if (selectedString == IsSelected.completed) {
        return 'Completed';
      } else {
        return 'Active';
      }
    }

    // final theme = Theme.of(context).colorScheme;
    // final isHovered = useState<bool>(false);
    final screenSize = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(5),
      ),
      width: screenSize.width,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 18,
          bottom: 18,
        ),
        child: Center(
          child: SizedBox(
            height: 20,
            width: isMobile ? screenSize.width * .75 : screenSize.width * .20,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: textTitles.length,
              itemBuilder: (context, index) {
                return MouseRegion(
                  onEnter: (event) {},
                  onExit: (event) {},
                  child: GestureDetector(
                    onTap: () {
                      // selectedString = textTitles[index];
                      ref
                          .read(selectedStringProvider.notifier)
                          .selectString(textTitles[index]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        textTitles[index],
                        style: GoogleFonts.josefinSans(
                          color: selected() == textTitles[index]
                              ? checkboxGradient[0]
                              : darkGrayishBlue2.toColor(),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
