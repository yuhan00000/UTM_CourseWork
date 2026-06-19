import java.util.Scanner;

public class MemoryAllocationSimulator {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("=== OS Memory Management Simulation ===");
        System.out.println("Memory Type:");
        System.out.println("1. Fixed Partitioning");
        System.out.println("2. Dynamic Partitioning");
        System.out.print("Choose (1/2): ");
        int memType = sc.nextInt();

        System.out.println("\nAlgorithm:");
        System.out.println("1. Next Fit");
        System.out.println("2. Worst Fit");
        System.out.print("Choose (1/2): ");
        int algo = sc.nextInt();

        System.out.print("\nEnter number of memory blocks: ");
        int nBlocks = sc.nextInt();
        int[] blocks = new int[nBlocks];
        int[] originalBlocks = new int[nBlocks];

        for (int i = 0; i < nBlocks; i++) {
            System.out.print("Enter size of block " + (i+1) + ": ");
            blocks[i] = sc.nextInt();
            originalBlocks[i] = blocks[i]; // keep original copy
        }

        System.out.print("\nEnter number of processes: ");
        int nProcesses = sc.nextInt();
        int[] processes = new int[nProcesses];
        
        for (int i = 0; i < nProcesses; i++) {
            System.out.print("Enter size of process " + (i + 1) + ": ");
            processes[i] = sc.nextInt();
        }

        int[] allocation = new int[nProcesses];

        if (memType == 1) { // Fixed
            boolean[] blockAllocated = new boolean[nBlocks];

            if (algo == 1)
                nextFitFixed(processes, blocks, allocation, blockAllocated);
            else
                worstFitFixed(processes, blocks, allocation, blockAllocated);

            printResult(processes, allocation, originalBlocks, blockAllocated, false);

        } else { // Dynamic
            if (algo == 1)
                nextFitDynamic(processes, blocks, allocation);
            else
                worstFitDynamic(processes, blocks, allocation);

            printResult(processes, allocation, blocks, null, true);
        }

        sc.close();
    }

    // Next Fit for Fixed
    public static void nextFitFixed(int[] processes, int[] blocks, int[] allocation, boolean[] blockAllocated) {
        int lastIndex = 0;
        int n = blocks.length;
        for (int i = 0; i < processes.length; i++) {
            allocation[i] = -1;
            int count = 0;
            while (count < n) {
                int idx = (lastIndex + count) % n;
                if (!blockAllocated[idx] && blocks[idx] >= processes[i]) {
                    allocation[i] = idx;
                    blockAllocated[idx] = true;
                    lastIndex = idx;
                    break;
                }
                count++;
            }
        }
    }

    // Worst Fit for Fixed
    public static void worstFitFixed(int[] processes, int[] blocks, int[] allocation, boolean[] blockAllocated) {
        for (int i = 0; i < processes.length; i++) {
            allocation[i] = -1;
            int worstIdx = -1;
            for (int j = 0; j < blocks.length; j++) {
                if (!blockAllocated[j] && blocks[j] >= processes[i]) {
                    if (worstIdx == -1 || blocks[j] > blocks[worstIdx]) {
                        worstIdx = j;
                    }
                }
            }
            if (worstIdx != -1) {
                allocation[i] = worstIdx;
                blockAllocated[worstIdx] = true;
            }
        }
    }

    // Next Fit for Dynamic
    public static void nextFitDynamic(int[] processes, int[] blocks, int[] allocation) {
        int lastIndex = 0;
        int n = blocks.length;
        for (int i = 0; i < processes.length; i++) {
            allocation[i] = -1;
            int count = 0;
            while (count < n) {
                int idx = (lastIndex + count) % n;
                if (blocks[idx] >= processes[i]) {
                    allocation[i] = idx;
                    blocks[idx] -= processes[i];
                    lastIndex = idx;
                    break;
                }
                count++;
            }
        }
    }

    // Worst Fit for Dynamic
    public static void worstFitDynamic(int[] processes, int[] blocks, int[] allocation) {
        for (int i = 0; i < processes.length; i++) {
            allocation[i] = -1;
            int worstIdx = -1;
            for (int j = 0; j < blocks.length; j++) {
                if (blocks[j] >= processes[i]) {
                    if (worstIdx == -1 || blocks[j] > blocks[worstIdx]) {
                        worstIdx = j;
                    }
                }
            }
            if (worstIdx != -1) {
                allocation[i] = worstIdx;
                blocks[worstIdx] -= processes[i];
            }
        }
    }

    public static void printResult(int[] processes, int[] allocation, int[] blocks, boolean[] fixedStatus, boolean isDynamic) {
        System.out.println("\n============== Allocation Result ==============");
        System.out.println("Process No\tProcess Size\tBlock Allocated");
        for (int i = 0; i < processes.length; i++) {
            String result = (allocation[i] == -1) ? "Not Allocated" : "Block " + (allocation[i] + 1);
            System.out.printf("%d\t\t%d\t\t%s\n", i + 1, processes[i], result);
        }

        System.out.println();
        if (isDynamic) {
            System.out.println("Remaining Block Sizes (Dynamic):");
            for (int i = 0; i < blocks.length; i++) {
                System.out.println("Block " + (i + 1) + ": " + blocks[i]);
            }
        } else {
            System.out.println("Block Allocation Status (Fixed):");
            for (int i = 0; i < blocks.length; i++) {
                System.out.println("Block " + (i + 1) + ": " + (fixedStatus[i] ? "Allocated" : "Free"));
            }
        }
    }
}
