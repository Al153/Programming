package gfx.tick3;

import org.joml.Matrix4f;
import org.joml.Vector3f;
import org.lwjgl.BufferUtils;
import org.lwjgl.glfw.GLFWCursorPosCallback;
import org.lwjgl.glfw.GLFWKeyCallback;
import org.lwjgl.glfw.GLFWScrollCallback;
import org.lwjgl.glfw.GLFWVidMode;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.FloatBuffer;
import java.nio.IntBuffer;

import static org.lwjgl.glfw.GLFW.*;
import static org.lwjgl.opengl.GL.createCapabilities;
import static org.lwjgl.opengl.GL11.*;
import static org.lwjgl.opengl.GL15.*;
import static org.lwjgl.opengl.GL20.*;
import static org.lwjgl.opengl.GL30.*;
import static org.lwjgl.system.MemoryUtil.NULL;

public class OpenGLApplication {

    // Vertical field of view
    private static final float FOV_Y = (float) Math.toRadians(50);
    private static final float HEIGHTMAP_SCALE = 3.0f;

    // Width and height of renderer in pixels
    protected static int WIDTH = 800, HEIGHT = 600;

    // Size of height map in world units
    private static float MAP_SIZE = 10;
    private final Camera camera;
    private long window;

    private ShaderProgram shaders;
    private float[][] heightmap;
    private final int no_of_triangles;
    private int vertexArrayObj;

    // Callbacks for input handling
    private GLFWCursorPosCallback cursor_cb;
    private GLFWScrollCallback scroll_cb;
    private GLFWKeyCallback key_cb;

    // Filenames for vertex and fragment shader source code
    private final String VSHADER_FN = "resources/vertex_shader.glsl";
    private final String FSHADER_FN = "resources/fragment_shader.glsl";

    public OpenGLApplication(String heightmapFilename) {

        // Initialize OpenGL context, and create window
        initializeOpenGL();

        // Create camera, and setup input handlers
        camera = new Camera((double) WIDTH / HEIGHT, FOV_Y);
        initializeInputs();

        // Create shaders and attach to a ShaderProgram
        Shader vertShader = new Shader(GL_VERTEX_SHADER, VSHADER_FN);
        Shader fragShader = new Shader(GL_FRAGMENT_SHADER, FSHADER_FN);
        shaders = new ShaderProgram(vertShader, fragShader, "colour");

        // Load heightmap data from file into CPU memory
        initializeHeightmap(heightmapFilename);

        // Initialize mesh data in CPU memory
        float vertPositions[] = initializeVertexPositions( heightmap );
        int indices[] = initializeVertexIndices( heightmap );
        float vertNormals[] = initializeVertexNormals( heightmap );
        no_of_triangles = indices.length;

        // Load mesh data onto GPU memory
        loadDataOntoGPU( vertPositions, indices, vertNormals );
    }

    // OpenGL setup - do not touch this method!
    public void initializeOpenGL() {

//        if (glfwInit() != GLFW_TRUE)
      if (glfwInit() != true)
            throw new RuntimeException("Unable to initialize the graphics runtime - ask for a demonstrator.");

        glfwWindowHint(GLFW_RESIZABLE, GLFW_FALSE);
        window = glfwCreateWindow(WIDTH, HEIGHT, "Tick 3", NULL, NULL);
        if (window == NULL)
            throw new RuntimeException("Failed to create the application window - ask for a demonstrator.");

        GLFWVidMode mode = glfwGetVideoMode(glfwGetPrimaryMonitor());
        glfwSetWindowPos(window, (mode.width() - WIDTH) / 2, (mode.height() - HEIGHT) / 2);
        glfwMakeContextCurrent(window);
        createCapabilities();

        // Enable v-sync
        glfwSwapInterval(1);

        // Cull back-faces of polygons
        glEnable(GL_CULL_FACE);
        glCullFace(GL_BACK);

        // Do depth comparisons when rendering
        glEnable(GL_DEPTH_TEST);
    }

    private void initializeInputs() {

        // Callback for: when dragging the mouse, rotate the camera
        cursor_cb = new GLFWCursorPosCallback() {
            private double prevMouseX, prevMouseY;

            public void invoke(long window, double mouseX, double mouseY) {
                boolean dragging = glfwGetMouseButton(window, GLFW_MOUSE_BUTTON_LEFT) == GLFW_PRESS;
                if (dragging) {
                    camera.rotate(mouseX - prevMouseX, mouseY - prevMouseY);
                }
                prevMouseX = mouseX;
                prevMouseY = mouseY;
            }
        };

        // Callback for: when scrolling, zoom the camera
        scroll_cb = new GLFWScrollCallback() {
            public void invoke(long window, double dx, double dy) {
                camera.zoom(dy > 0);
            }
        };

        // Callback for keyboard controls: "W" - wireframe, "P" - points, "S" - take screenshot
        key_cb = new GLFWKeyCallback() {
            public void invoke(long window, int key, int scancode, int action, int mods) {
                if (key == GLFW_KEY_W && action == GLFW_PRESS) {
                    glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
                    glDisable(GL_CULL_FACE);
                } else if (key == GLFW_KEY_P && action == GLFW_PRESS) {
                    glPolygonMode(GL_FRONT_AND_BACK, GL_POINT);
                }else if (key == GLFW_KEY_S && action == GLFW_RELEASE) {
                    takeScreenshot("screenshot.png");
                } else if (action == GLFW_RELEASE) {
                    glEnable(GL_CULL_FACE);
                    glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
                }
            }
        };

        // Set callbacks on the window
        glfwSetCursorPosCallback(window, cursor_cb);
        glfwSetScrollCallback(window, scroll_cb);
        glfwSetKeyCallback(window, key_cb);
    }

    /**
     * Create an array of vertex psoutions.
     *
     * @param heightmap 2D array with the heightmap
     * @return Vertex positions in the format { x0, y0, z0, x1, y1, z1, ... }
     */
    private float[] initializeVertexPositions( float[][] heightmap ) {
        //generate and upload vertex data

        // TODO: Replace the table below with your code generating vertex positions from the heightmap.
        float[] vertPositions = new float[] {
                -2,  2, -2, -2,  2,  2,  2,  2, -2,
                -2,  2,  2,  2,  2,  2,  2,  2, -2,
                -2, -2,  2, -2, -2, -2,  2, -2,  2,
                -2, -2, -2,  2, -2, -2,  2, -2,  2,
                -2,  2,  2, -2, -2,  2,  2,  2,  2,
                -2, -2,  2,  2, -2,  2,  2,  2,  2,
                -2, -2, -2, -2,  2, -2,  2, -2, -2,
                -2,  2, -2,  2,  2, -2,  2, -2, -2,
                -2, -2, -2, -2, -2,  2, -2,  2, -2,
                -2, -2,  2, -2,  2,  2, -2,  2, -2,
                2,  2, -2,  2,  2,  2,  2, -2, -2,
                2,  2,  2,  2, -2,  2,  2, -2, -2
        };

        return vertPositions;
    }

    private int[] initializeVertexIndices( float[][] heightmap ) {

        // TODO: Replace the table below with your code geneting indices from the heightmap.

        int[] indices = new int[] {
                0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11,
                12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23,
                24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35
        };

        return indices;
    }

    private float[] initializeVertexNormals( float[][] heightmap ) {

        // TODO: Replace the table below with your code geneting vertex normals.
        float[] vertNormals = new float[] {
                0,  1,  0,  0,  1,  0,  0,  1,  0,
                0,  1,  0,  0,  1,  0,  0,  1,  0,
                0, -1,  0,  0, -1,  0,  0, -1,  0,
                0, -1,  0,  0, -1,  0,  0, -1,  0,
                0,  0,  1,  0,  0,  1,  0,  0,  1,
                0,  0,  1,  0,  0,  1,  0,  0,  1,
                0,  0, -1,  0,  0, -1,  0,  0, -1,
                0,  0, -1,  0,  0, -1,  0,  0, -1,
                -1,  0,  0, -1,  0,  0, -1,  0,  0,
                -1,  0,  0, -1,  0,  0, -1,  0,  0,
                1,  0,  0,  1,  0,  0,  1,  0,  0,
                1,  0,  0,  1,  0,  0,  1,  0,  0
        };

        return vertNormals;
    }

    public void initializeHeightmap(String heightmapFilename) {

        try {
            BufferedImage heightmapImg = ImageIO.read(new File(heightmapFilename));
            int heightmap_width_px = heightmapImg.getWidth();
            int heightmap_height_px = heightmapImg.getHeight();

            heightmap = new float[heightmap_height_px][heightmap_width_px];

            for (int row = 0; row < heightmap_height_px; row++) {
                for (int col = 0; col < heightmap_width_px; col++) {
                    float height = (float) (heightmapImg.getRGB(col, row) & 0xFF) / 0xFF;
                    heightmap[row][col] = HEIGHTMAP_SCALE * (float) Math.pow(height, 2.2);
                }
            }
        } catch (IOException e) {
            throw new RuntimeException("Error loading heightmap");
        }
    }

    public void loadDataOntoGPU( float[] vertPositions, int[] indices, float[] vertNormals ) {

        int shaders_handle = shaders.getHandle();

        vertexArrayObj = glGenVertexArrays(); // Get a OGL "name" for a vertex-array object
        glBindVertexArray(vertexArrayObj); // Create a new vertex-array object with that name

        // ---------------------------------------------------------------
        // LOAD VERTEX POSITIONS
        // ---------------------------------------------------------------

        // Construct the vertex buffer in CPU memory
        FloatBuffer vertex_buffer = BufferUtils.createFloatBuffer(vertPositions.length);
        vertex_buffer.put(vertPositions); // Put the vertex array into the CPU buffer
        vertex_buffer.flip(); // "flip" is used to change the buffer from read to write mode

        int vertex_handle = glGenBuffers(); // Get an OGL name for a buffer object
        glBindBuffer(GL_ARRAY_BUFFER, vertex_handle); // Bring that buffer object into existence on GPU
        glBufferData(GL_ARRAY_BUFFER, vertex_buffer, GL_STATIC_DRAW); // Load the GPU buffer object with data

        // Get the locations of the "position" vertex attribute variable in our ShaderProgram
        int position_loc = glGetAttribLocation(shaders_handle, "position");

        // If the vertex attribute does not exist, position_loc will be -1, so we should not use it
        if (position_loc != -1) {

            // Specifies where the data for "position" variable can be accessed
            glVertexAttribPointer(position_loc, 3, GL_FLOAT, false, 0, 0);

            // Enable that vertex attribute variable
            glEnableVertexAttribArray(position_loc);
        }

        // ---------------------------------------------------------------
        // LOAD VERTEX NORMALS
        // ---------------------------------------------------------------

        // TODO: Put normal array into a buffer in CPU memory
        // TODO: Create an OpenGL buffer and load it with normal data
        // TODO: Get the location of the "normal" variable in the shader
        // TODO: Specify how to access the variable, and enbale it

        // ---------------------------------------------------------------
        // LOAD VERTEX INDICES
        // ---------------------------------------------------------------

        IntBuffer index_buffer = BufferUtils.createIntBuffer(indices.length);
        index_buffer.put(indices).flip();
        int index_handle = glGenBuffers();
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, index_handle);
        glBufferData(GL_ELEMENT_ARRAY_BUFFER, index_buffer, GL_STATIC_DRAW);

        // Finally, check for OpenGL errors
        checkError();
    }


    public void run() {

        while (glfwWindowShouldClose(window) != true) {
            render();
        }
    }

    public void render() {

        // Step 1: Pass a new model-view-projection matrix to the vertex shader

        Matrix4f mvp_matrix; // Model-view-projection matrix
        mvp_matrix = new Matrix4f(camera.getProjectionMatrix()).mul(camera.getViewMatrix());

        int mvp_location = glGetUniformLocation(shaders.getHandle(), "mvp_matrix");
        FloatBuffer mvp_buffer = BufferUtils.createFloatBuffer(16);
        mvp_matrix.get(mvp_buffer);
        glUniformMatrix4fv(mvp_location, false, mvp_buffer);

        // Step 2: Clear the buffer

        glClearColor(1.0f, 1.0f, 1.0f, 1.0f); // Set the background colour to dark gray
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

        // Step 3: Draw our VertexArray as triangles

        glBindVertexArray(vertexArrayObj); // Bind the existing VertexArray object
        glDrawElements(GL_TRIANGLES, no_of_triangles, GL_UNSIGNED_INT, 0); // Draw it as triangles
        glBindVertexArray(0);              // Remove the binding

        // Step 4: Swap the draw and back buffers to display the rendered image

        glfwSwapBuffers(window);
        glfwPollEvents();
        checkError();
    }

    public void takeScreenshot(String output_path) {
        int bpp = 4;

        glReadBuffer(GL_FRONT);
        ByteBuffer buffer = BufferUtils.createByteBuffer(WIDTH * HEIGHT * bpp);
        glReadPixels(0, 0, WIDTH, HEIGHT, GL_RGBA, GL_UNSIGNED_BYTE, buffer);
        checkError();

        BufferedImage image = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_ARGB);
        for (int i = 0; i < WIDTH; ++i) {
            for (int j = 0; j < HEIGHT; ++j) {
                int index = (i + WIDTH * (HEIGHT - j - 1)) * bpp;
                int r = buffer.get(index + 0) & 0xFF;
                int g = buffer.get(index + 1) & 0xFF;
                int b = buffer.get(index + 2) & 0xFF;
                image.setRGB(i, j, 0xFF << 24 | r << 16 | g << 8 | b);
            }
        }
        try {
            ImageIO.write(image, "png", new File(output_path));
        } catch (IOException e) {
            throw new RuntimeException("failed to write output file - ask for a demonstrator");
        }
    }

    public void stop() {
        glfwDestroyWindow(window);
        glfwTerminate();
    }

    private void checkError() {
        int error = glGetError();
        if (error != GL_NO_ERROR)
            throw new RuntimeException("OpenGL produced an error (code " + error + ") - ask for a demonstrator");
    }
}
